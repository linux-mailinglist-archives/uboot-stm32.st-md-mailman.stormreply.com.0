Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 637AB26471C
	for <lists+uboot-stm32@lfdr.de>; Thu, 10 Sep 2020 15:38:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C509C424B8
	for <lists+uboot-stm32@lfdr.de>; Thu, 10 Sep 2020 13:38:35 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C91E2C424B8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Sep 2020 13:38:31 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id e16so6781166wrm.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Sep 2020 06:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J0M4Y7ezYZdddyPc2aZKr9BNfbSyQMR9nsPfDqvZv+E=;
 b=WzwO6UrQYGiHUp13G0OVSEkKG4qpvR+IJMdYo//izQ9DZ5OJYUiwnIvAnE7kGgtWBA
 joB7H85cXM0aKb4NN2Mxu+hw/ws/e/cNPpgetuBtJSyQCI/UGv643eebL/wvIeyEEN6e
 /7E0YpfpTTJ2iSOyerFUzQX+ahdswNddI4Kf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J0M4Y7ezYZdddyPc2aZKr9BNfbSyQMR9nsPfDqvZv+E=;
 b=Qc1lL+EPQbOcCbKN1nWidr9C8oVUOR+6tDnXxYJCSwN510usHxK1koR9P2iGJrrnYu
 T88j8VzQBH1NsMsOy3CC2mUAWIJzE/G3QEWjEkFpXSAHcu/7uEn776KezHd2tQoFwvlZ
 5udXSuejshJ4NnmJPKgjH3pn4quYvrHTevUtBVBGGv10VzhTXobOkwE85xzswDyaR+Ku
 NoHyqOR4M2BdXxHEK8cUqCnsmt/ybmxJp9Vurpi/iIPpOj3Q73p2cmPikkpwKQGeapIy
 Rxrxfntd1sV3afFXCC/b+8a+HDlx9hPQ52Shf2WgXIVhaW7ffiMJ8LMKxOrBVLW6pzVV
 5cMg==
X-Gm-Message-State: AOAM533l3Je1XycZPYZtOB2GhDKisL1DI77v2OSlVz/c6TcbhtLu7oDG
 UJwkZVus0vIFLO4i3hARuEJ4YcVeRiXrRuJW1AvzGw==
X-Google-Smtp-Source: ABdhPJyzfFNMs1kVCKrlMnJH1zXk6GkNlvASbcm3B7hlfEA/EW8pYz4HWQk3p6+I7drvZaz/20C/vMLKjWSu+j+CC0I=
X-Received: by 2002:a5d:680b:: with SMTP id w11mr9708789wru.73.1599745111169; 
 Thu, 10 Sep 2020 06:38:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200909162617.31576-1-patrick.delaunay@st.com>
In-Reply-To: <20200909162617.31576-1-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 10 Sep 2020 07:38:18 -0600
Message-ID: <CAPnjgZ2buH_QojwY-+S+Vj=N-PWmT0+0u+raxy10FV1UOOvpEg@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Bin Meng <bmeng.cn@gmail.com>,
 Heiko Schocher <hs@denx.de>, Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [Uboot-stm32] [PATCH] gpio: Convert to use APIs which support
	live DT
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

On Wed, 9 Sep 2020 at 10:26, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Use ofnode_ or dev_ APIs instead of fdt_ and fdtdec_ APIs so that the
> driver can support live DT.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/gpio/gpio-uclass.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
