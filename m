Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA75C31B7D
	for <lists+uboot-stm32@lfdr.de>; Sat,  1 Jun 2019 12:53:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4773C0C1D0
	for <lists+uboot-stm32@lfdr.de>; Sat,  1 Jun 2019 10:53:36 +0000 (UTC)
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
 [209.85.166.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D601C0C1CF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  1 Jun 2019 10:53:36 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id a186so20005054itg.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 01 Jun 2019 03:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=euMBMWlWVueAkM24T6mSVQFLjpFNATK6bVqtdN1MGmw=;
 b=XSFprewARg5joTZHpKfE4aRxMUgktKSTeTiXYHBUVVMyXPZ4yi6Xhf+cv09yg+qZrX
 gEDbz+KWuwtzcDpqoHIvIuMGif3Xt/v3pYdElWqOQdGpIatL2xVMiCtnPGtH++1vl0rR
 v+w/mjj0sSfZX/3TXiPLrj7ix8t6Ns+w2CgtY1jxoDMV4OYGITKsU/VCom7oQP9i1QEN
 91VDWfKveMFZhoO3AuLfxTAy/kP0Ml2wa/6Kj2/KHVGBrIIEDQjzUGr8Z9HyeA4ePqPZ
 7lO7NreqjesTnyn9FidjbwYY35UBjAp/cUP9YPQBDXSjNbPEEwq+q4Pm+Xj1/SqJu1u8
 vfvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=euMBMWlWVueAkM24T6mSVQFLjpFNATK6bVqtdN1MGmw=;
 b=JDLOvu70TBeB9hnljoWTorEn9+KU8UzZShaTBblPdJyP8QWwxAa2PTdxXxBq6tEpLT
 JOVe3mxPLPMR0u7XIaMM1VFwQFy7wzThgeJv94/3qDruhtR/8YJYFQ8AYCxlx+n2r/B5
 NXRVe+SovcBVYIjWY3UWQn5UBpuA2orAocKziWzw+rki6QgZ0UEXKHlB5ATWuQFv7Uw+
 2kGP7ctSth7UxDQnbXI/iq2UoPhl3LCy0reUAGEZPJvqaA6gcfpsxzhhFwX/8rm5HrC+
 xtC+xxHEBe9hr1DwD1Fep0h3VGxPl0mqabvsu9eNwl58ibf4+DHMRgoifM6sCRv1JzEG
 KFPg==
X-Gm-Message-State: APjAAAXOOvEg0388123UivTX87pgVS0e1hfECzPpoOIj7XXT3taw2Dgb
 6XMn6/6s7yx44eFQxQli48YJzI43tJ0IhLeWF+g=
X-Google-Smtp-Source: APXvYqyibXQTCCw2keA2K/++UN1Gi0VuDR0X8OaNnEIAVvIjFzwVhAhNEi2ADi2CJ5v5ylLxN3dG5yT/ZASBI6DKXm0=
X-Received: by 2002:a24:610d:: with SMTP id s13mr4367870itc.156.1559386414610; 
 Sat, 01 Jun 2019 03:53:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190517130847.13144-1-christophe.roullier@st.com>
 <20190517130847.13144-7-christophe.roullier@st.com>
In-Reply-To: <20190517130847.13144-7-christophe.roullier@st.com>
From: Joe Hershberger <joe.hershberger@gmail.com>
Date: Sat, 1 Jun 2019 05:53:25 -0500
Message-ID: <CANr=Z=YiXyNW7nFCZNZhyDLVO+-vBJv3OxFBb88kD3yYnBVXBg@mail.gmail.com>
To: Christophe Roullier <christophe.roullier@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH v2 6/6] configs: stm32mp15:
	Enable Ethernet feature
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

On Fri, May 17, 2019 at 8:19 AM Christophe Roullier
<christophe.roullier@st.com> wrote:
>
> This allows to enable Ethernet and use driver for
> Synopsys Ethernet QoS device
>
> Signed-off-by: Christophe Roullier <christophe.roullier@st.com>

Acked-by: Joe Hershberger <joe.hershberger@ni.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
