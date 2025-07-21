return {
    {
        'nvim-orgmode/orgmode',
        event = 'VeryLazy',
        ft = { 'org' },
        config = function()
            -- Setup orgmode
            require('orgmode').setup({
                org_agenda_files = '~/org/**/*',

                org_hide_leading_stars = true,
                org_hide_emphasis_markers = true,

                org_todo_keywords = { "TODO(t)", "PLANNING(p)", "DOING(i@/!)", "|", "DONE(d!)", "BLOCKED(b@)", "WONTDO(w@/!)" },
                org_todo_keyword_faces = {
                    TODO = ':foreground #DAA520 :weight bold',     -- GoldenRod
                    PLANNING = ':foreground #FF1493 :weight bold', -- DeepPink
                    DOING = ':foreground #00FFFF :weight bold',    -- cyan
                    DONE = ':foreground #32CD32 :weight bold',     -- LimeGreen
                    BLOCKED = ':foreground #ff0000 :weight bold',  -- red
                    WONTDO = ':foreground #32CD32 :weight bold',   -- LimeGreen
                },

                org_capture_templates = {
                    i = {
                        description = 'Inbox',
                        template = '** %?',
                        target = '~/org/inbox.org',
                        headline = 'Inbox',
                        empty_lines = {
                            before = 0,
                            after = 1,
                        },
                    },
                    w = {
                        description = 'Work Note',
                        template = '** %?',
                        target = '~/org/notes.org',
                        headline = 'Frete Notes',
                        empty_lines = {
                            before = 0,
                            after = 1,
                        },
                    },
                    t = {
                        description = 'General To-Do',
                        template = '* TODO [#B] %?\n:Created: %T\n ',
                        target = '~/org/todos.org',
                        headline = 'Tasks',
                        empty_lines = {
                            before = 0,
                            after = 1,
                        },
                    },
                    c = {
                        description = 'Code To-Do',
                        template = '* TODO [#B] %?\n:Created: %T\n%a\nProposed Solution: ',
                        target = '~/org/todos.org',
                        headline = 'Code Tasks',
                        empty_lines = {
                            before = 0,
                            after = 1,
                        },
                    }
                }
            })
        end,
    },
    {
        "chipsenkbeil/org-roam.nvim",
        dependencies = {
            {
                "nvim-orgmode/orgmode",
            },
        },
        config = function()
            require("org-roam").setup({
                directory = "~/org/roam",

                templates = {
                    d = {
                        description = "default",
                        template = "%?",
                        target = "%<%Y%m%d%H%M%S>-%[slug].org",
                    },
                    p = {
                        description = "Project",
                        template = "* Goals\n\n%?\n\n* Tasks\n\n** TODO Add initial tasks\n\n* Notes\n\n",
                        target = "project-%<%Y%m%d>-%[slug].org"
                    }
                },

                extensions = {
                    dailies = {
                        templates = {
                            d = {
                                description = "default",
                                template = "* TODO [#B] %?\n:Created: %T\n\n * Notes\n ",
                                target = "%<%Y-%m-%d>.org",
                            },
                        },
                    },
                },
            })
        end
    }
}
