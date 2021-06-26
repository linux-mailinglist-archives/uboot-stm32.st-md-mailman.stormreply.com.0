Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD003B4FDD
	for <lists+uboot-stm32@lfdr.de>; Sat, 26 Jun 2021 20:32:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14E0DC57B6C;
	Sat, 26 Jun 2021 18:32:02 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3CDBCC57B53
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 26 Jun 2021 18:32:00 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 59-20020a9d0ac10000b0290462f0ab0800so5331839otq.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 26 Jun 2021 11:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g0+u88jBLc4RuxWlxPAa2kqyMgG7dHOQt14vabdQfRI=;
 b=MHaLTVzeBt58AqVw55BVb/SpsFLzXomkv7MMo928cwPIgnoGiDqK9HyIQ37HG4OWU/
 pY013tjE3StEmhm/5W0x6MfFc7v+YQCpLmSSPs7bTNaD2nvVembLkeVjRSYBbFw1gha0
 0EFw+im1Brt+4O7OKNO5UqBCtKzRnkUruaTL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g0+u88jBLc4RuxWlxPAa2kqyMgG7dHOQt14vabdQfRI=;
 b=dYhCsxNkZlWVwWBK/N7p3e8Q4BOd6houxSgSsJuAqhiY0hCoAPlLZbDxUuTilgMkuc
 KmPuffL+MY0C0RWYZwZJG6Fr7X55gLma/UKpDWUHtOuM7Sm6VAkqGIMujwhIXOF11jAO
 ya7wBh9ril6KIFMibRZ8MYy88h7Hy8Dhv+TsJf7h06nhbmU0fhc2Emyj9yn0jIxbRi75
 X2SOaDDFlfv6b8m4sLJlXIL3VZoMB2v2yrtVhpmbIaAp1zvI7z+AKZHQq5zxQ4Fej1Ny
 8IBJz05PqQ8mf6r3kMyrQV/L4EQmbqVgH0B81OfnA5J1yPh6a6Pk1IhZYMdNkGahgPDT
 QbDg==
X-Gm-Message-State: AOAM530iDedR885wS3EGUUxvi5JkEpCreFDnQkwu6+MF0hN7X8D3Nm9C
 2ZeRAo0rAeNFWpPswN3oxGw7oxAvHZgkCmLtvTT/GA==
X-Google-Smtp-Source: ABdhPJyEEIbQd3qv6vUxIVpdeQ2vAHI1ffaLfIMkZYBYTaDHQJRRgVO5PzN8klYVQd1VlpXW/YNJ0TgzwU4KLQCOH7w=
X-Received: by 2002:a9d:2dc2:: with SMTP id g60mr14878153otb.54.1624732318644; 
 Sat, 26 Jun 2021 11:31:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210419094534.9748-1-patrice.chotard@foss.st.com>
 <20210419094534.9748-4-patrice.chotard@foss.st.com>
In-Reply-To: <20210419094534.9748-4-patrice.chotard@foss.st.com>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 26 Jun 2021 12:31:45 -0600
Message-ID: <CAPnjgZ0MuzCFXimTmre+g-it+evB24BNp9c13CBbVOijE2aFzw@mail.gmail.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marex@denx.de>, Herbert Poetzl <herbert@13thfloor.at>
Subject: Re: [Uboot-stm32] [PATCH v2 3/5] usb: sandbox: Add gadget callbacks
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

On Mon, 19 Apr 2021 at 03:47, Patrice Chotard
<patrice.chotard@foss.st.com> wrote:
>
> Add usb_gadget_handle_interrupts(), usb_gadget_register_driver()
> and usb_gadget_unregister_driver() to be able to test
> binding usb gadget.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Herbert Poetzl <herbert@13thfloor.at>
> ---
>
> (no changes since v1)
>
>  drivers/usb/host/usb-sandbox.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)

Reviewed-by: Simon Glass <sjg@chromium.org>

But it looks like gadgets should be converted to DM properly?
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
