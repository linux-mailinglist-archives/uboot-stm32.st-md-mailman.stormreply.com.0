Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9884514D522
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jan 2020 03:18:17 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 613E7C36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jan 2020 02:18:17 +0000 (UTC)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4DDA7C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Jan 2020 02:18:16 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id q8so1547851ljj.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jan 2020 18:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=08DC2lDM72lvk3LFm02Cv/2QxWBPKvx/P7gzeSETX08=;
 b=LXjf+/gdYBWo4wD7Fd5XF/rIoZ7tqTttzNVxZSgjHi6Ly7k3IKuXAQr+zuertQWlu7
 X03+yKqGwQbmzAQLlzxKEl1fkrT5AahSyFRliWWGKhPTFfpQqI0Kel+DSlMt7yy6Ecty
 srwEhwUZnAf4AIB/ur0kvfB5QzfJqQC2E3atg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=08DC2lDM72lvk3LFm02Cv/2QxWBPKvx/P7gzeSETX08=;
 b=AumkMc9u2duYebWApbkYVXgvIKBS8tqVV9EMGM/ElddbZdaEX75QkfK3W2puI7FPqW
 FtWr9p55HNF/SUOCrt78JpVypiyds2oL5ElUsGqPSKb7Mzv56jN6o0hgm2iwj63m9FvM
 iOaHoBDZg+PbtqmYxC4Z6VyFkqyWjo0c+02flOZZ9cYZHkeh2Wi682MrQWGYSieSs+na
 bR8mAVKlv6Wyqcp1K4VLy/8qx1qJGU9HZ0rGXnOqxSi316WyM097O+UuGAru7/5Yto3x
 rGcmAhSaEWnFoAWrUzUu0VlxThUhoWddZ0+ZUWU6YL+cdw5N83OqDMgC+4SWbhKqTTHA
 GWMQ==
X-Gm-Message-State: APjAAAUe1jzQU9Hcm3QgZf1vDDKe4hqAyFf1wRvMBaEvb9yudkf4kqMb
 shZd1KpnlkELua5BIqXmcF2esxKfw411FiBpPc5s1g==
X-Google-Smtp-Source: APXvYqy5lvmcOFLWm3WsHiPMOkcF8RTX6pja3gLyRT2IIl6qNHpkjwjd9q6sde0wFVefvKcQJSHgf8IzH6+FHf48eww=
X-Received: by 2002:a2e:804b:: with SMTP id p11mr1238923ljg.235.1580350695303; 
 Wed, 29 Jan 2020 18:18:15 -0800 (PST)
MIME-Version: 1.0
References: <20200124123346.32210-1-patrick.delaunay@st.com>
 <20200124123346.32210-2-patrick.delaunay@st.com>
In-Reply-To: <20200124123346.32210-2-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 29 Jan 2020 19:17:47 -0700
Message-ID: <CAPnjgZ0iAyDJhwo8Qnj7jWuzz-St1ors+Ap8p__Qjy8+2rCVyA@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: Leo Ruan <tingquan.ruan@cn.bosch.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Frank Wunderlich <frank-w@public-files.de>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 2/5] cmd: env: use ENV_IS_IN_DEVICE in env
	info
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

On Fri, 24 Jan 2020 at 05:34, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Use the define ENV_IS_IN_DEVICE to test if one the
> CONFIG_ENV_IS_IN_...  is defined and correct the detection of
> persistent storage support in the command "env info"
> if CONFIG_ENV_IS_NOWHERE is activated.
>
> Since commit 60d5ed2593c9 ("env: allow ENV_IS_NOWHERE with
> other storage target") test CONFIG_ENV_IS_NOWHERE is not
> enough; see also commit 953db29a1e9c6 ("env: enable saveenv
> command when one CONFIG_ENV_IS_IN is activated").
>
> This patch avoids issue for this command in stm32mp1 platform.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  cmd/nvedit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Simon Glass <sjg@chromium.org>

We should add more tests for the environment functionality.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
