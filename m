Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7C2414D48
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Sep 2021 17:43:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B50EC5A4CE;
	Wed, 22 Sep 2021 15:43:55 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8FE3C5A4CC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Sep 2021 15:43:54 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id q81so7452032qke.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Sep 2021 08:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jzwFboT+7kuP5pfR9u2JNFAJWMS1foLrAKoTPs/a2qI=;
 b=AYZo6IWd9e0spwbl2g+gu7JbwOQWtEraKYMo2An5f/A7SkcN25PvzL/kg63Jn3q9eq
 bk2K/JNVKL3P43O76FfmmkTnZ1M6+dNI/PtvM3IqxQB6oitg0xNH02MxQF3ma0PUAVco
 CYZoy1EJvANufCtvXrduwaDppsJSBy4MPh+IiezvSfuSIlfGn8/5gh03Dbh/uwk+MX2M
 WvFpFuYkq3dKC/XlW6CX3RZ2exiwZJyXlQh7MHpUWmxyezGKPoFvDHkPDlO3rxTktrH8
 pqYlWvFJIwf9JMY+MiUlHaARfa0FYrIyFbojm96dOd9tqV/yhPFGrNLtOI2/oE1hMZHJ
 VifQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jzwFboT+7kuP5pfR9u2JNFAJWMS1foLrAKoTPs/a2qI=;
 b=VzAh2rydNGz7nmunvUCU4jBOmivcD43FNKDNCh40CWyWPqYJSBk3dGEnL/5rcP41B8
 n5Thhuz+GGIMOrPn+wWVyTywNlybMBkOQITDCg8nhF9oJgkMulTOjoZ94xK+ifKeOkWe
 ZDxmG4d8HAKDQqxe7Y+Eafzw6dPImExJ1z2kJVBMt1DhpicFGjz3sQF6iACNmHFkCUGn
 /nf32SzQrYW245ki/rEtOalwLBkSGqOcLryVEKufhZgdijpr/bsmCmQOgDe+wJrIu9JZ
 mV99L28g84ed+vWaXnevqyON6zfcKUAFrQha7qxfKHGVFTCDm3GSCbxv8WY3Ukhp0YOO
 7mBw==
X-Gm-Message-State: AOAM531jQNAdMkCYQkEuC4swyFriaxdMeV0u+dxwGNxUqfL5KeJTnESA
 q2iRca65+NkkKQqn8pwv3/SSfREYFtLsjJgnBoQH0CUjF4aHbg==
X-Google-Smtp-Source: ABdhPJzx4V/1lb5HF7kXAvfb4pL3LlnNrJuHVkT/6Av/oetfEqqULdS+08ItEo4tJIRMEisRury0996LBG4mJOPAtpA=
X-Received: by 2002:a05:6902:70b:: with SMTP id
 k11mr517613ybt.313.1632325433081; 
 Wed, 22 Sep 2021 08:43:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210921181848.1.I7649d2cbc9b43ca9aef6daa71bb76212a3ff9822@changeid>
In-Reply-To: <20210921181848.1.I7649d2cbc9b43ca9aef6daa71bb76212a3ff9822@changeid>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 22 Sep 2021 23:43:42 +0800
Message-ID: <CAEUhbmUOHpk68MJDq=joErZugQkT0ALd5pXf8K-Y8Dqd32=JNA@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Vipin Kumar <vipin.kumar@st.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] MAINTAINERS: remove SPEAR entry
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

On Wed, Sep 22, 2021 at 12:19 AM Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> As the lastest spear directories are removed, delete the associated entry
> in the MAINTAINERS file:
> - arch/arm/cpu/arm926ejs/spear/
> - arch/arm/include/asm/arch-spear/
>
> Fixes: 570c3dcfc153 ("arm: Remove spear600 boards and the rest of SPEAr support")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>  MAINTAINERS | 7 -------
>  1 file changed, 7 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
