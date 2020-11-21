Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB0A2BC297
	for <lists+uboot-stm32@lfdr.de>; Sun, 22 Nov 2020 00:08:54 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5709C56639;
	Sat, 21 Nov 2020 23:08:53 +0000 (UTC)
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 89E1EC56638
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 21 Nov 2020 23:08:52 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id t143so15180652oif.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 21 Nov 2020 15:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h1OrBHp0apBXRivFchFHrXtL891dKjC7LYJ8bYGPBFc=;
 b=edgCrsphtl/M+ZFjAhVUl8eONSvC+L9cF1ZCzb5jFzu01VHA6wictPSOBGxJtjQbRS
 JE92FXuzqKO2Q4D60pb4wjtWXnLx/l32vLfbrdBVWwN3nVHWNB3a87Z+fbB7ygLVWKkw
 mTs+52sifkVF8da6bCTL6yu5TmefrpMoyHhKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h1OrBHp0apBXRivFchFHrXtL891dKjC7LYJ8bYGPBFc=;
 b=k0pKLGF6bayfaUQeLl9rX8pgN1MQqw5UZNUCjPos+UisVFiySUcCE6Fy6eX6fb3S4y
 HxcQM05PC8ZLITtHpkTzR9dhqoWOy8Y2nuzyFvsCpEM5j30WR8/1tst0Ce0KjQyAwgs9
 ZuCDOJUBU4Q9qIOzSZWI1IA089heQLYDpjRhgqb/+ZRGrCV6AHXMZm89ZGErg8aGansL
 G3keQeNkx21xAC4svMzcOhHBajkABnZAcmlUmvCWy2GTvwdFVY0sk1kYqRUXgjBUzcyh
 o+JZK6T4sGo2VG98c6Jw7K5Tlp4aoHNWSVfXzisS4S0PZinY1sBqy2su79uOorpvddJz
 fgBw==
X-Gm-Message-State: AOAM530+bTCxLHDSELkG8r/yfG1EsPzp7fZtBHTtJvZ5F/acAYQZgk4a
 zBePwIf25EqL5Jf8XZi41dodqXpWfbAJHzqe/DQXqA==
X-Google-Smtp-Source: ABdhPJyx3CGqRUM200hcOsUoMZCtK5RqJCN2/BBP1M+jmT7I10+1M+aASkkWh71SHfbHz2DxD8BUXPIMKNbUAwThBjY=
X-Received: by 2002:a05:6808:8ec:: with SMTP id
 d12mr9969084oic.150.1606000130059; 
 Sat, 21 Nov 2020 15:08:50 -0800 (PST)
MIME-Version: 1.0
References: <20201119090843.5614-1-patrick.delaunay@st.com>
In-Reply-To: <20201119090843.5614-1-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 21 Nov 2020 16:07:43 -0700
Message-ID: <CAPnjgZ2JJbuv7LQOrY=L_0Q2WMPjdkmQjcoJhXOsETP8t1adGg@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: Re: [Uboot-stm32] [PATCH 1/3] test: cmd_ut_category: raise a error
 when the test is not found
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

On Thu, 19 Nov 2020 at 03:09, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Raise an error when test is not found, for example with manual test
> with bad test name, as following, doesn't raise an error
>
> => ut lib bad
> Failures: 0
>
> After the patch:
>
> => ut lib bad
> lib test bad not found
> Failures: 1
>
> This patch allows also to detect tests which don't respect the expected
> format with "prefix" used in cmd_ut_category and defined in ut_subtest
> (./test/py/conftest.py). When I execute "make qcheck" this patch detects
> 2 issues, corrected by the 2 next patches.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  test/cmd_ut.c | 7 +++++++
>  1 file changed, 7 insertions(+)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
