Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F542BC294
	for <lists+uboot-stm32@lfdr.de>; Sun, 22 Nov 2020 00:08:13 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59C78C56639;
	Sat, 21 Nov 2020 23:08:13 +0000 (UTC)
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0501FC56639
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 21 Nov 2020 23:08:10 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id z16so12432893otq.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 21 Nov 2020 15:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fSD3Mi3B6j1PgQM+xSKm3JBTk0plFl1BiezC8m1UhWA=;
 b=E5IJEkKouzrPA+DY1jkvlkvxSxKnBU4boKbnW7RqSTM2HDexMLVJ7Nft+mpmq4mpB3
 3u80HFhZtqxvtF+R2qZASf7LXu596ZLw1GYlZrMNEG3/3Bxz/tXsPYUGGrT5GisDEvmL
 eEz8M0uwyES2bAN7YQPJojeu+sw5a/EyhTVT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fSD3Mi3B6j1PgQM+xSKm3JBTk0plFl1BiezC8m1UhWA=;
 b=to1CUOKGCTrFXK/Ms2jwsG8VjBfKajCFZZg0xupeYwSd4lIhtVI5Nla7ExVAhzjFg2
 ugZ1HrhExiFrqlOkK100kVicv3LQ9MB3sIx06GAdH0VRFDrRPxAnP53x6Uht1h/XrSG5
 eT3ZQEoXxnlbSMSnh6PWZ6OZn9V+OPtRCt4phsYOvhb5WY3nc6SccOh92rkzS7yMhL+w
 MTjpE0mW3pgz4PUa3nFW33x3IICHI57Rbpv4YcdpHfYum6OOlqUES0ONn60gFpuK+EW0
 jRiReZQbkTPqRdrNyPK/KX1kMDaokub0Aa7UesYsXXdoxFVs0aAgQY9dNtHdOvsv36Db
 EnqQ==
X-Gm-Message-State: AOAM530CoR0ewGi5JmOxTJ3H/nDQLr30xTuesFjsBcB/6c58vdcfvQBg
 gh1kLGYCUzlBiX1SeF3Ink7cohBEmeQGWvKKte/uXw==
X-Google-Smtp-Source: ABdhPJy+byMnI7BcN5ahf+0weZFPjkSjez/YqsAMaAtbagFS/cQoFbJLwzbJM7cCYqSkXDoEgDGZeZsxUTzy4B97BHw=
X-Received: by 2002:a05:6830:12d0:: with SMTP id
 a16mr17485182otq.88.1606000089216; 
 Sat, 21 Nov 2020 15:08:09 -0800 (PST)
MIME-Version: 1.0
References: <20201119090843.5614-1-patrick.delaunay@st.com>
 <20201119090843.5614-3-patrick.delaunay@st.com>
In-Reply-To: <20201119090843.5614-3-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 21 Nov 2020 16:07:47 -0700
Message-ID: <CAPnjgZ08TsfM3qQdFVow_Goe7YKtusef2X3OdKTP10bddKSUJQ@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: Re: [Uboot-stm32] [PATCH 3/3] test: correct the test prefix in ut
	str
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
> Align the prefix used in cmd_ut_category function and name of tests
> for ut str.
> This patch solves the issues detected by "make qcheck" after previous
> patch.
>
> Fixes: fdc79a6b125d ("lib: Add a function to convert a string to upper case")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  test/str_ut.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
