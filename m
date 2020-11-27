Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 938FB2C683F
	for <lists+uboot-stm32@lfdr.de>; Fri, 27 Nov 2020 15:53:54 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D88CCC56630;
	Fri, 27 Nov 2020 14:53:53 +0000 (UTC)
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AFD78C36B36
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Nov 2020 14:53:52 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id l7so3382314qtp.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Nov 2020 06:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=X+p+BTyhr0k87bx6OcOR7Ugz/sApBe6vExjKZDMIAng=;
 b=fjDFqejKziJoFkpDW9+l47JGdmi77AJd3y8hsrHkFlaWuuDm83c+MxVwNsoAB4Av5U
 P0oKvsCPgBkmt0IJmYFXPtXzOeFy2ZUYKmVgJVOLWdzMcRiaFiD4jI+j1lATt6GLHG/y
 6UsFBrqS1ahYLvN0NCB583LSoZ91wJsw6SAwzD4/3V3pAfugvDUbKlsK/kQxXaWdUUfC
 4htapWx4ywqeeuXD0ghfkX9LjvYA1MnHQOEWUzEVgvhUm++jezqMdVDWPqB9KDWNHHVz
 JzJIMDPpuEmXG+ldvbHdPAjH1q2q5Nrx+/mmfRC/JRBxsFfMFZJ/MCGj3dnBH0lUFM8Z
 Cc4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=X+p+BTyhr0k87bx6OcOR7Ugz/sApBe6vExjKZDMIAng=;
 b=g+kA8wu5wx2TKM809Yfdz94WVWcuYihZH2AM9589AuXsWjncO8fbJ7ZJ9hTNXNWhUt
 1gxMiDD/FJCSGQdrCNp4AFYJtkwxky+kj9b7mxqe+vvvCFMkSuQu5O94uwyrQWYXdfiY
 vkmku8FslIQKcjIrgsoGDZw7GgJmEiOvKq64trbyb182ZyiIBd3OsKkn5LBjiIdU1R3b
 yGyxCGiEx1E3MZv3tpVxWu6txcolAMJgBtkt1CuAHlt3SV0F5WhZyM9aoLQyUstm6iRS
 0S6thKn7wowUAfnDx6T25S2xCmw/lsPjny1oxS588b2s5q26mjRRVyg+EKoywNQphSFm
 achQ==
X-Gm-Message-State: AOAM532Z9dUH7vFEp6Tm9id8x/5kBGiZSZDQkbf6aE9Zo21DIoNOOZFY
 ILME+U17GQdOGioFAFLkhHTb3iE0wgNGLw==
X-Google-Smtp-Source: ABdhPJw++lC9wGkBoPpCWy6a0v9ggxSv+o9X4tmt81DUncIyYueRJM+B9lZg6rFZsFZVQofRwzp5cA==
X-Received: by 2002:ac8:714e:: with SMTP id h14mr8779370qtp.301.1606488831264; 
 Fri, 27 Nov 2020 06:53:51 -0800 (PST)
Received: from [192.168.1.201] (pool-108-51-35-162.washdc.fios.verizon.net.
 [108.51.35.162])
 by smtp.googlemail.com with ESMTPSA id g63sm1124124qkf.80.2020.11.27.06.53.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Nov 2020 06:53:50 -0800 (PST)
To: Patrick Delaunay <patrick.delaunay@st.com>, u-boot@lists.denx.de
References: <20201127102100.11721-1-patrick.delaunay@st.com>
 <20201127102100.11721-2-patrick.delaunay@st.com>
From: Sean Anderson <seanga2@gmail.com>
Message-ID: <c9c6b638-9ceb-2f3b-c290-8506543ba0d6@gmail.com>
Date: Fri, 27 Nov 2020 09:53:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201127102100.11721-2-patrick.delaunay@st.com>
Content-Language: en-US
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH v2 1/9] test: add LOGL_FORCE_DEBUG flags
 support in log tests
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

On 11/27/20 5:20 AM, Patrick Delaunay wrote:
> Add a check of the _log function with LOGL_FORCE_DEBUG flags,
> used to force the trace display.
> 
> The trace should be displayed for all the level when flags
> have LOGL_FORCE_DEBUG bit is set, for any filter.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 
> Changes in v2:
> - Add test for LOGL_FORCE_DEBUG (NEW)
> 
>   test/log/log_test.c | 29 ++++++++++++++++++++---------
>   1 file changed, 20 insertions(+), 9 deletions(-)
> 
> diff --git a/test/log/log_test.c b/test/log/log_test.c
> index ea4fc6bc30..15874751f9 100644
> --- a/test/log/log_test.c
> +++ b/test/log/log_test.c
> @@ -26,6 +26,11 @@ static int do_log_run(int cat, const char *file)
>   		_log(log_uc_cat(cat), i, file, 100 + i, "func", "_log %d\n",
>   		     i);
>   	}
> +	/* test with LOGL_COUNT flag */
> +	for (i = LOGL_FIRST; i < LOGL_COUNT; i++) {
> +		_log(log_uc_cat(cat), i | LOGL_FORCE_DEBUG, file, 100 + i,
> +		     "func", "_log force %d\n", i);
> +	}
>   
>   	gd->log_fmt = log_get_default_format();
>   	return 0;
> @@ -38,6 +43,7 @@ static int do_log_run(int cat, const char *file)
>   #define EXPECT_LOG BIT(0)
>   #define EXPECT_DIRECT BIT(1)
>   #define EXPECT_EXTRA BIT(2)
> +#define EXPECT_FORCE BIT(3)
>   
>   static int do_check_log_entries(struct unit_test_state *uts, int flags, int min,
>   				int max)
> @@ -54,6 +60,11 @@ static int do_check_log_entries(struct unit_test_state *uts, int flags, int min,
>   		for (; i <= LOGL_MAX ; i++)
>   			ut_assert_nextline("func() _log %d", i);
>   
> +	for (i = LOGL_FIRST; i < LOGL_COUNT; i++) {
> +		if (flags & EXPECT_FORCE)
> +			ut_assert_nextline("func() _log force %d", i);
> +	}
> +
>   	ut_assert_console_end();
>   	return 0;
>   }
> @@ -66,10 +77,10 @@ static int do_check_log_entries(struct unit_test_state *uts, int flags, int min,
>   
>   #define check_log_entries_flags(flags) \
>   	check_log_entries_flags_levels(flags, LOGL_FIRST, _LOG_MAX_LEVEL)
> -#define check_log_entries() check_log_entries_flags(EXPECT_LOG | EXPECT_DIRECT)
> +#define check_log_entries() check_log_entries_flags(EXPECT_LOG | EXPECT_DIRECT | EXPECT_FORCE)
>   #define check_log_entries_extra() \
> -	check_log_entries_flags(EXPECT_LOG | EXPECT_DIRECT | EXPECT_EXTRA)
> -#define check_log_entries_none() check_log_entries_flags(0)
> +	check_log_entries_flags(EXPECT_LOG | EXPECT_DIRECT | EXPECT_EXTRA | EXPECT_FORCE)
> +#define check_log_entries_none() check_log_entries_flags(EXPECT_FORCE)
>   
>   /* Check a category filter using the first category */
>   int log_test_cat_allow(struct unit_test_state *uts)
> @@ -126,7 +137,7 @@ int log_test_file(struct unit_test_state *uts)
>   
>   	ut_assertok(console_record_reset_enable());
>   	log_run_file("file");
> -	check_log_entries_flags(EXPECT_DIRECT | EXPECT_EXTRA);
> +	check_log_entries_flags(EXPECT_DIRECT | EXPECT_EXTRA | EXPECT_FORCE);
>   
>   	ut_assertok(console_record_reset_enable());
>   	log_run_file("file2");
> @@ -147,7 +158,7 @@ int log_test_file_second(struct unit_test_state *uts)
>   
>   	ut_assertok(console_record_reset_enable());
>   	log_run_file("file2");
> -	check_log_entries_flags(EXPECT_DIRECT | EXPECT_EXTRA);
> +	check_log_entries_flags(EXPECT_DIRECT | EXPECT_EXTRA | EXPECT_FORCE);
>   
>   	ut_assertok(log_remove_filter("console", filt));
>   	return 0;
> @@ -182,8 +193,8 @@ int log_test_level(struct unit_test_state *uts)
>   
>   	ut_assertok(console_record_reset_enable());
>   	log_run();
> -	check_log_entries_flags_levels(EXPECT_LOG | EXPECT_DIRECT, LOGL_FIRST,
> -				       LOGL_WARNING);
> +	check_log_entries_flags_levels(EXPECT_LOG | EXPECT_DIRECT | EXPECT_FORCE,
> +				       LOGL_FIRST, LOGL_WARNING);
>   
>   	ut_assertok(log_remove_filter("console", filt));
>   	return 0;
> @@ -351,7 +362,7 @@ int log_test_level_deny(struct unit_test_state *uts)
>   
>   	ut_assertok(console_record_reset_enable());
>   	log_run();
> -	check_log_entries_flags_levels(EXPECT_LOG | EXPECT_DIRECT,
> +	check_log_entries_flags_levels(EXPECT_LOG | EXPECT_DIRECT | EXPECT_FORCE,
>   				       LOGL_WARNING + 1, _LOG_MAX_LEVEL);
>   
>   	ut_assertok(log_remove_filter("console", filt1));
> @@ -374,7 +385,7 @@ int log_test_min(struct unit_test_state *uts)
>   
>   	ut_assertok(console_record_reset_enable());
>   	log_run();
> -	check_log_entries_flags_levels(EXPECT_LOG | EXPECT_DIRECT,
> +	check_log_entries_flags_levels(EXPECT_LOG | EXPECT_DIRECT | EXPECT_FORCE,
>   				       LOGL_WARNING, LOGL_INFO - 1);
>   
>   	ut_assertok(log_remove_filter("console", filt1));
> 

Reviewed-by: Sean Anderson <seanga2@gmail.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
