Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5D95A67CB
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Aug 2022 17:57:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39B2AC57B6C;
	Tue, 30 Aug 2022 15:57:16 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com
 [209.85.160.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8691C03FD4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Aug 2022 15:57:14 +0000 (UTC)
Received: by mail-oa1-f51.google.com with SMTP id
 586e51a60fabf-11edd61a9edso11688631fac.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Aug 2022 08:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=xElvYJ/YS/d3VSieHH659t1w9xHyGsIY3s10tExyjgc=;
 b=XFxaFZAM7zNHG31DJBQsD+JzbPhvrWHzXCghK5RpzEKrViudGLc0d5q/eTaGHxexv2
 C5OCTH0u9tN/oD2b1mXxdr61stoGk5IQr3XoTv05D41+FZFAKR5fffNoDVs8xdysV7rd
 kRsF8CrVHtEfldUerGZmC3w/Adl6WgL4k97Uw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=xElvYJ/YS/d3VSieHH659t1w9xHyGsIY3s10tExyjgc=;
 b=XUKURXjhCuj6TbQe2KbK0JmtJhg4U0Vws4xYVF3LuHKkpl+7C4U4xTgWtg+xkzG9PJ
 1qTt5jR7/GejJaDjDFD1Ev/bcsH8ETEgisFUJfyqwRs/mic6uNlrhRd58xGegB8kG00u
 JElSimJgy3ab5N35VKcvgroedgE/muKEBFv/nCRA5hXezUbWzeFVS6gmzcokWxHEWhwt
 425+/IuAgS/HDSx6sg5FL5+A0sU0upvuMQs5Vp05fU++V1RsfqtSvnPzzJ2nzKI8kvc2
 sycbVo+a+N41jzEuvk2eDCWk2TlKaU60YD7eXSPrQEfQU2Qmfg3u3eVR2sw9X2wJ2ZZX
 +98A==
X-Gm-Message-State: ACgBeo1SQ41XYb0cGwaG7TWhPX6J5D4YG0fGgmUAQr6PzO+6TxIuA7uz
 fLS0NzEW/JnHO1SUS+Ya9w5sF+ootW83fQhoZ0WToA==
X-Google-Smtp-Source: AA6agR4HDh0QqnI1j8BMmhQGnvovQV2AAxo0R9jZsliwooVKQ6AEYtOxMJRDaiwdDXx0ponUSd4BH3bt8Aejtyk7PwI=
X-Received: by 2002:aca:1901:0:b0:344:d4b5:9a1f with SMTP id
 l1-20020aca1901000000b00344d4b59a1fmr9362205oii.170.1661875033546; Tue, 30
 Aug 2022 08:57:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220830145628.2386366-1-patrice.chotard@foss.st.com>
In-Reply-To: <20220830145628.2386366-1-patrice.chotard@foss.st.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 30 Aug 2022 09:56:58 -0600
Message-ID: <CAPnjgZ1FZdj9N=9A+nt=D4Pn=Pd3XNJ2_Zrd+eDcUQ0o5X+K1g@mail.gmail.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: Re: [Uboot-stm32] [PATCH] doc: Add gpio status output fields
	description
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

On Tue, 30 Aug 2022 at 08:56, Patrice Chotard
<patrice.chotard@foss.st.com> wrote:
>
> Add gpio status output fields description and one output example.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>  doc/usage/cmd/gpio.rst | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
