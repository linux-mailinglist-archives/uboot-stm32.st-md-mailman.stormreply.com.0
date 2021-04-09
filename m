Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DF12635A832
	for <lists+uboot-stm32@lfdr.de>; Fri,  9 Apr 2021 22:58:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8605AC56639;
	Fri,  9 Apr 2021 20:58:38 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25E6DC32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Apr 2021 20:58:36 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 u5-20020a7bcb050000b029010e9316b9d5so3636119wmj.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 09 Apr 2021 13:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q52dAO8BWqqj9w8+xzGDFF7E3Z6+GZgknNJQB1Txqa4=;
 b=kN5/G2x26tTG8gmt+zJUiIhrewXGhh5LWuBrPCdg4pK6UOi83023p+onXCO5mEC6CE
 zu4dO2cylZOqXK5MjjwK8YVZJmQmVjRFlK4gPaPtNOytFq6wciBmg27dbIKu8Bogp7N5
 yteQSblt+TPqFeVnx4aC7MZRDSvVreobKgX0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q52dAO8BWqqj9w8+xzGDFF7E3Z6+GZgknNJQB1Txqa4=;
 b=Q79U5xMnQZXsb83BxDlDwS2bFvf4DqQJ++saIBDVRv8l1h3PXSEBab0y5RinThMXd8
 lFNUbXcCKyrYzNSk9o4YYl1r2Pv/X0FsIGmkkLV7VhbFq7Pi98E45ClGfTkYiY+4AFFF
 r0x9pJStmkSLjTiLExAaqfQY/VCBc3v2esoZBSXZRrDfYBhXHcivJmCr/uOHSU8CbAsN
 YsA8yg/aI+5o8xjqwcRTQYBvuUwIZXhuKXKzKN7uV7bSUwgWKnkbin5WEEKlQWKTTgVd
 NpRc6FYrjiCgPvrI/gNrTjqVYdLUBYox4X/LIWwo+0293AWCKi8OK8xkuQhJQr62xzDY
 LQRg==
X-Gm-Message-State: AOAM533QCY++WcS95J1XJ3Vgef//ebaa1MO06Itsy2noiei0YhacXAv4
 PnJ8Px2oGRrg6kOXfChjepGYEx3D/8RV/2XmCv8iXQ==
X-Google-Smtp-Source: ABdhPJx8jRifIFEwegYbUercazK6pfjjddn0aTBrRj7m/RssHwhvpDYXoBkUDRKgsh/O7WA2+N+XVIW9Oc7d6hE+D2c=
X-Received: by 2002:a7b:c1cf:: with SMTP id a15mr8067156wmj.168.1618001915871; 
 Fri, 09 Apr 2021 13:58:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210409180126.1.I120ba9a4276e42538cae6f1f1aac51221c63f6ad@changeid>
In-Reply-To: <20210409180126.1.I120ba9a4276e42538cae6f1f1aac51221c63f6ad@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 10 Apr 2021 08:58:23 +1200
Message-ID: <CAPnjgZ1uMdA1_ic7bny1WmAdHKNX9sGNJBOP8VG2q-CRxTGyYw@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Stephen Warren <swarren@nvidia.com>, Masahiro Yamada <masahiroy@kernel.org>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Ovidiu Panait <ovidiu.panait@windriver.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>
Subject: Re: [Uboot-stm32] [PATCH] board_f: cosmetic: change the debug trace
	to KB in reserve_video
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

On Sat, 10 Apr 2021 at 04:02, Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> Update the debug trace for the reserved video memory to KB as indicated
> in the message with "%luk"; before the patch the computed size
> gd->relocaddr - addr is in bytes.
>
> This patch aligns the debug trace in reserve_video() with others
> functions, for example on stm32mp157c-dk2:
>
>   - Reserving 3080192k for video at: dfd00000
>   + Reserving 3008k for video at: dfd00000
>     Reserving 873k for U-Boot at: dfc25000
>     Reserving 32776k for malloc() at: ddc23000
>     Reserving 72 Bytes for Board Info at: ddc22fb0
>     Reserving 280 Bytes for Global Data at: ddc22e90
>     Reserving 119072 Bytes for FDT at: ddc05d70
>     Reserving 0x278 Bytes for bootstage at: ddc05af0
>
> Fixes: 5630d2fbc50f3035 ("board: Show memory for frame buffers")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>  common/board_f.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
