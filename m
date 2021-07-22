Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF27D3D2C78
	for <lists+uboot-stm32@lfdr.de>; Thu, 22 Jul 2021 21:10:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E65CC5A4CE;
	Thu, 22 Jul 2021 19:10:36 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91ABAC5A4CD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jul 2021 19:10:34 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id
 f93-20020a9d03e60000b02904b1f1d7c5f4so2742800otf.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jul 2021 12:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EFb8APweHFNjRfFIME2/u3yo7Ouwx5VqBR/Yn57sImk=;
 b=LHjtTkfwRfUV88hksdgWM2inaU3Dua263Us7ip1n1inQt1UILBQw5ZQuGjUJBNTQyS
 gZwcLpFg6qUvp7Ipa7B/3WlcH9rOFb+BI2FSwC+KXhEUWqjK2WL1cndBTb0iqMfCabgM
 FOGS3ptQsWkK0U6UuDadKAJF7aeLQdSDJlq1YdVSxr0hXTbWtCCJaJWkRBuw+7DRT4lj
 aKzXZMq4G87mvYgt9mmmj57HhwEOTUzOv5F6cTGl+JlhIm/RQQOURY4O+VTJvdPRKM0S
 nztOoXl2ON1H3ysNdymEi7Ws5+f1M6p0zD4OGndbTUACW1jaavY/y9PAX2splyPNS3bP
 alhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EFb8APweHFNjRfFIME2/u3yo7Ouwx5VqBR/Yn57sImk=;
 b=fYMaeRtC0p40KoUF4wZjc5mPB1hM5jIK5WvQhdqas8ZHJCoFRvnLLt7y6ERE2NtVfd
 /N3apmS8jXmvk102Q9eUoBo/gfQltQJpxYY6MCKFSd6tCSWMEpNZi+xR21UZS0m86p4O
 6H76B4nos/poaMCStIU8CfdePZmuMd5dHZpj9cIGtr8a/xuQ76C00rYeurOAnbsk6q4i
 M2OCT7PGaCumGhg91ENdIlSW1YcML7V1niFt8nzoX3FpNHnCVYmllwdjcI68F1LICFYo
 7AbiKZeJUO+H4DEqH6jCeoxVQSqCH+Bank+2TDz0kuTBB8XTza8vUbFfNOZ7+lumRZxk
 E2GA==
X-Gm-Message-State: AOAM533jRrNSBCp2MubrmoOVchrNA5WSiC/BVx+YgtXw1XsHrqHpYAPZ
 EkW7HHJxyUMojFsoUERO4097T7m5QJQoRkYXVF4=
X-Google-Smtp-Source: ABdhPJy1xst1PgGEPgPqBefTuUO+mMuuiuLfUsEdy0/sYMA2rXkRmUbMeQdyRgsw66d+Zm2FW01sxGDubBSqepw97Wk=
X-Received: by 2002:a05:6830:1390:: with SMTP id
 d16mr903237otq.31.1626981033147; 
 Thu, 22 Jul 2021 12:10:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210720181530.2949296-1-patrick.delaunay@foss.st.com>
In-Reply-To: <20210720181530.2949296-1-patrick.delaunay@foss.st.com>
From: Ramon Fried <rfried.dev@gmail.com>
Date: Thu, 22 Jul 2021 22:10:21 +0300
Message-ID: <CAGi-RUJ2Grf-hKGxxSJo8s43bw+CrUY56t02GCttyrHfTQuO7A@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [RESEND PATCH 1/3] net: eth-phy: define
	LOG_CATEGORY
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

On Tue, Jul 20, 2021 at 9:15 PM Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> Define LOG_CATEGORY to allow filtering with log command.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Reviewed-by: Ramon Fried <rfried.dev@gmail.com>
> ---
>
>  drivers/net/eth-phy-uclass.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/net/eth-phy-uclass.c b/drivers/net/eth-phy-uclass.c
> index 07aebd935e..abb658bf21 100644
> --- a/drivers/net/eth-phy-uclass.c
> +++ b/drivers/net/eth-phy-uclass.c
> @@ -3,6 +3,8 @@
>   * Copyright 2020 NXP
>   */
>
> +#define LOG_CATEGORY UCLASS_ETH_PHY
> +
>  #include <common.h>
>  #include <dm.h>
>  #include <net.h>
> --
> 2.25.1
>

Applied to u-boot-net/network-master
Thanks,
Ramon.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
