Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 862312C8EC4
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Nov 2020 21:13:13 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E14DCC424BF;
	Mon, 30 Nov 2020 20:13:12 +0000 (UTC)
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40B06C424BE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Nov 2020 20:13:09 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id f48so4073682otf.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Nov 2020 12:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y8dnTNy/Zfm+CDN0fYASFwxtyh62pez9gmENyzb4F2U=;
 b=cE97grtwXG01cybwUzt2GE/H3SeR2xvBxV8KX3P86c+NNae++kPjDAW6xdEQeRtUrq
 RoDeCyxAg64D9z2yvcbjmqXD37JEPtQnY4fjEzwd7St6Qw0dAjP2PkJInFOKS51n1u0a
 mEEwkryZMOxENY8W2VN4bE1O6k7rnPLRr+Gas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y8dnTNy/Zfm+CDN0fYASFwxtyh62pez9gmENyzb4F2U=;
 b=g541f4po1aXvDu7Pve+t7TOYMGC4VNm3ifYh0C4Ed1jbVnXxUDZUqeigDOibxJRPyh
 SiJCYcN7kPSfdf/3lOGthIgkwC4YxBgQn5Nq0Hf1mppw1O9i0YSc1fhoK6OvPYAQqGG2
 VmIGUtp2g0dkU4X0+rqlADAUCh3Sp4QE6v3+a3VqS1/LtenPGTOhMqa6L7armP+Zza/3
 aMBve8YaCHbzZxHPRGVit5vNVNrr7SDbBmgpMjCx0D9ZQi01vGC/8jgJbyNK+A/CdjCb
 BhcDjJ6np+/cw/vP1khWIy/oQpZceDJVfctAY35PAO20erUs1THRlyA2Ef50fkGLcTXQ
 a/Ew==
X-Gm-Message-State: AOAM532F1TZ/dd/V79qk87nAsuuX5KmDjbcHHumWM3GDjy9BN1jfhQVf
 WAs55ls/9CVO+Z6kr+hhZEv2hKe1mo1zzVKK9LVxsA==
X-Google-Smtp-Source: ABdhPJz50r/vBUZ/3YZ2nIiwKTFXWCI+OAVI+2sgFlfZAirVTkeJUsceLFzeBh3U0LBo7tt6hdu8LJ87nbF7oILGxiM=
X-Received: by 2002:a05:6830:18a:: with SMTP id
 q10mr18239132ota.54.1606767188249; 
 Mon, 30 Nov 2020 12:13:08 -0800 (PST)
MIME-Version: 1.0
References: <20201127104930.32692-1-patrick.delaunay@st.com>
 <20201127114927.2.Ida70f4fb1524187703e9240d63e436f8ae5adaab@changeid>
In-Reply-To: <20201127114927.2.Ida70f4fb1524187703e9240d63e436f8ae5adaab@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 30 Nov 2020 13:12:11 -0700
Message-ID: <CAPnjgZ10epegATj3mBvjh0uLchyt9jGzAPt0KaF=NJ2FVNQHBQ@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Anatolij Gustschin <agust@denx.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] console: sandbox: remove unnecessary
	sandbox code
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

Hi Patrick,

On Fri, 27 Nov 2020 at 03:49, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Remove the specific sandbox code in console.c, as the config
> CONFIG_DEBUG_UART is already supported in drivers/serial/sandbox.c
> and activated by default in all sandbox defconfig
> (CONFIG_DEBUG_UART_SANDBOX=y and CONFIG_DEBUG_UART=y).
>
> This patch allows to test the console code under DEBUG_UART in sandbox
> and avoids to include the file <os.h> in this u-boot generic code.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  common/console.c | 15 ---------------
>  1 file changed, 15 deletions(-)

Please see this commit as to why I put that code back, after removing it myself.

64e9b4f346f Revert "sandbox: Drop special case console code for sandbox"

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
