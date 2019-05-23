Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 620272732E
	for <lists+uboot-stm32@lfdr.de>; Thu, 23 May 2019 02:18:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22DDCCC10A3
	for <lists+uboot-stm32@lfdr.de>; Thu, 23 May 2019 00:18:35 +0000 (UTC)
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48CD9CC10A3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 May 2019 00:18:33 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id 66so3835728otq.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 May 2019 17:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rKnvV9fYxPEG9fCwgCwWj/4MhaqRfXUurJLB25W8byc=;
 b=Q8UIvZkaRo7o5MfV5MrSnJf19RhpnsbIQNlZSik3zM9H11M4fI+3s5bjPyJqCW81Dw
 8fUAXrMrOomnvA6zGJWt4dFIQI2leI9noizkzyWSj5j6AMz51K9jHpK8S/7QaLqXAG1O
 Le//sREvQhG+E242xrBIulqiKFyQValV6m4KM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rKnvV9fYxPEG9fCwgCwWj/4MhaqRfXUurJLB25W8byc=;
 b=kyjG1OS7+96k2lu/DBFGdpun/9DiKSu0IWi2Vqxc3IJjvOkEapPLMW9I4ST0rYfn33
 RzZNBVHVgvM70GGriNjX7DcpXbbR3bWCp8aAzg2QB1IBbLMM/Q9dPMSQQPdYbxdtsA6d
 iv4AdoteEpSB+UrTWupYZiqD8Ab5ishIspsMUgjv9mC3jc82ADfTud3pJMNMURIeZ+Vt
 P8A/zORODECNHQKWKWdsunBkyr9KAnJCuhwgWmPcm7iMLpzSHgvVH6W1u5QunJ+vGDYn
 6QOIp49+dXrDl3ZIo9G6gt0tLizJMCDBEA3FeLHPmsicwzI8R9UQD25J/NIfeIEFohdb
 qqYA==
X-Gm-Message-State: APjAAAUzYG2rsGTdcqBbCEoJGabbgb0toqryXPno0SkZAmlxqKCFRh7y
 nw9wMCHY5fxvIyxCRkgJhv2ImyW1f0b9Ta+3NyG/Aw==
X-Google-Smtp-Source: APXvYqz3IngznQ8tZz+zzVtJPOF5nvybPCyVZSfYyIOvAbyqnrbUjaEeWz74UGhOLh4VImaraDxLhx7lEaBTazo94J4=
X-Received: by 2002:a9d:400d:: with SMTP id m13mr20927345ote.100.1558570711732; 
 Wed, 22 May 2019 17:18:31 -0700 (PDT)
MIME-Version: 1.0
References: <1558512409-32376-1-git-send-email-fabien.dessenne@st.com>
 <1558512409-32376-3-git-send-email-fabien.dessenne@st.com>
In-Reply-To: <1558512409-32376-3-git-send-email-fabien.dessenne@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 22 May 2019 18:18:20 -0600
Message-ID: <CAPnjgZ0ZdfOS4gA2VCtemko2z6T34+qe0djuRN6sNBZkCwooZg@mail.gmail.com>
To: Fabien Dessenne <fabien.dessenne@st.com>
Cc: Christophe Kerello <christophe.kerello@st.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Andreas Dannenberg <dannenberg@ti.com>
Subject: Re: [Uboot-stm32] [PATCH 2/7] dm: core: Introduce
	xxx_translate_dma_address()
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

Hi Fabien,

On Wed, 22 May 2019 at 02:07, Fabien Dessenne <fabien.dessenne@st.com> wrote:
>
> Add the following functions to translate DMA address to CPU address:
> - dev_translate_dma_address()
> - ofnode_translate_dma_address()
> - of_translate_dma_address()
> These functions work the same way as xxx_translate_address(), with the
> difference that the translation relies on the "dma-ranges" property
> instead of the "ranges" property.
>

Looks good, but again, needs a test.

> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> ---
>  drivers/core/of_addr.c |  4 ++++
>  drivers/core/ofnode.c  |  8 ++++++++
>  drivers/core/read.c    |  5 +++++
>  include/dm/of_addr.h   | 18 ++++++++++++++++++
>  include/dm/ofnode.h    | 16 +++++++++++++++-
>  include/dm/read.h      | 20 +++++++++++++++++++-
>  6 files changed, 69 insertions(+), 2 deletions(-)
>

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
