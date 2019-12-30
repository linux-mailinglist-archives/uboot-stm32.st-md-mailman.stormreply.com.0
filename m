Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA3612CB93
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Dec 2019 02:21:28 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69C7BC36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Dec 2019 01:21:28 +0000 (UTC)
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8910BC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Dec 2019 01:21:27 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id w21so36563793otj.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 29 Dec 2019 17:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QOvKzBnsVMtFwFyTrBfIlxCEMR+k1CTse+bMJQ0AnmM=;
 b=jSeMPsFcjUPHHmvxkEdzg/JDpLpMGRMO7CJh82gq57arAdosfDuYKdLNezkQQAjTFa
 2YCAzlfWMR0HRc/6gTTLibjTbD3ViKexJ2Wjpi4Ama+UFvBFJlyzLSXteWwYXPLuFYE3
 jW8r9XdDeuPvBOxnpeBsfC6LesNq/RujQn2J8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QOvKzBnsVMtFwFyTrBfIlxCEMR+k1CTse+bMJQ0AnmM=;
 b=gcZi3owa2Mv/ZbYB19d4xMRDzb7IlG+JqYfnW0csVB6JxG8q5y97pjK8T/QGwJw6bi
 kf5nuqV/2U2qQwtSAS9svMvQbTTYkBs4QQWwE4Qyb28nO8i/j4DVXJpRaWwnUd5KENlh
 mOOnBpDmZZgHi1wlwIHQ6HhkWJtmetwV/qV2ag8rdE0Io23PTg0aHO6YRMAqvpxyAC3Q
 YkeI8RX/122XHCWLmL2v8UAPgJxwbnO4Tt58uht97bDrdbeJIlx3m0KEHoRIMsyiO35B
 MNyf2r6KZB1OUMMfCAVxrqYi1tWZXA9FqGvvFeUL91i7tJvhQjBc1rpMZuwoRMfeAmS+
 pI0Q==
X-Gm-Message-State: APjAAAXdpj+kwFx12xcm5eawxZP5WGds4wzO6KBj/ZmT7it9C8u6Yxo4
 gF2NUlGi837bu2Czd/8n/xCZBo/S4fbWSW1/0120YtW6
X-Google-Smtp-Source: APXvYqyFaMnUMcCYykmHjYJ1UFtT9Xn9KQHKxS0XSB5mOhvmymnZiPAyzQYaVayQ4fGPymS2p4xVrNIN/zOexcG/Pys=
X-Received: by 2002:a9d:74d8:: with SMTP id a24mr74859087otl.100.1577668886080; 
 Sun, 29 Dec 2019 17:21:26 -0800 (PST)
MIME-Version: 1.0
References: <20191126084911.19761-1-patrick.delaunay@st.com>
 <20191126084911.19761-8-patrick.delaunay@st.com>
In-Reply-To: <20191126084911.19761-8-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Sun, 29 Dec 2019 18:21:13 -0700
Message-ID: <CAPnjgZ308-+oYNWsu7H4K8Op7efpMfGaGZg_ezuJDU1XfrRNZg@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Bin Meng <bmeng.cn@gmail.com>,
 Heiko Schocher <hs@denx.de>
Subject: Re: [Uboot-stm32] [PATCH v2 07/14] gpio: add gpio descriptor
	initialization helper
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

On Tue, 26 Nov 2019 at 01:49, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Add a helper function gpio_desc_init() to initialize the gpio descriptor;
> with this function the flags will be always set to 0.
>
> It wasn't the case before this patch in dm_gpio_lookup_name.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v2:
> - add gpio descriptor initialization helper
>
>  drivers/gpio/gpio-uclass.c | 27 +++++++++++++++++++--------
>  1 file changed, 19 insertions(+), 8 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
