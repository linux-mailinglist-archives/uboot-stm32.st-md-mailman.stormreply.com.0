Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A05B32E1E74
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Dec 2020 16:43:24 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ADC44C5717E;
	Wed, 23 Dec 2020 15:43:23 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8AFEFC32E90
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Dec 2020 15:43:18 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id 3so6508517wmg.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Dec 2020 07:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:from:in-reply-to:references:date:message-id
 :subject:to:cc;
 bh=fcSlcsA7+7JBl/uGUFyrhjefiss8rKFRPxEFyC67aiM=;
 b=d/s3qWlhOPQMFp8iZUH//9aNv/iiuVqT8GqXUyH9OenJ5g5yPd4I5kr+ZU7PQ79FU2
 tVdtw4mOWX4IjU6vvfgECrSA+hH8tKLX5TxWaw+swXPQZlzNotGXpkHktLyV3mfOx0Ds
 c8GpNYUj60+uribhdDGYVxPrNldHv8j7Rn/cY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:from:in-reply-to:references
 :date:message-id:subject:to:cc;
 bh=fcSlcsA7+7JBl/uGUFyrhjefiss8rKFRPxEFyC67aiM=;
 b=JHVekg4AccnudAicXT5gcvrvutBMO2cDcdLaakyUTsCUU0BdI7B61zkZhjQF64ccSp
 xBZInN30awCL8Oyve4BjBiujsG3bwTszt0gJDmNc38V6F3qZDRd5zJCR3PXrCOx0Byko
 H1iNgBpWAiE9qVTKDzeJNUdEk/JhH51aKAmTqZQ7I9GwsflRSOVH5kbljaFtPq5uLqv9
 5e/v8UmiKUYoztuukY44A1qDqdEROu2SyMZGwVMtvlpY0Xwr22gmiqrialNg0JX2bkgG
 4UNrLaKp7XkKy1T3LCnxmDn3l8uvX+kQIYF6Ektd+tQcsWdCUPMxlOiqgmKelWc0tRzl
 lPjA==
X-Gm-Message-State: AOAM530I+aQ9/KtJIicZzMf9iBmLhKJtT/UJZ9YTuCBFFSCdVg0Q/AFc
 BxrE/hcp9Wjuub+Cw9SsHLlIzAAkb0/ybGPTaLy6kg==
X-Google-Smtp-Source: ABdhPJxEyTnZJ36ecGgOIrSwq8Jv0445HcXh6GH3ChEZlgMCrVxkwfb6WfpmWD5zgKU0Jt2j+Da0bUhkpyI7FXdodA0=
X-Received: by 2002:a7b:cf0d:: with SMTP id l13mr317994wmg.168.1608738197536; 
 Wed, 23 Dec 2020 07:43:17 -0800 (PST)
Received: from 480794996271 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 23 Dec 2020 07:43:13 -0800
MIME-Version: 1.0
From: Simon Glass <sjg@chromium.org>
In-Reply-To: <CAPnjgZ2Z20Xoipi1QqdW2H1sb=ScGs_Dn6qYw4aR_BJBdLcssg@mail.gmail.com>
References: <CAPnjgZ2Z20Xoipi1QqdW2H1sb=ScGs_Dn6qYw4aR_BJBdLcssg@mail.gmail.com>
 <20201127104930.32692-1-patrick.delaunay@st.com>
Date: Wed, 23 Dec 2020 07:43:13 -0800
X-Google-Sender-Auth: 1-w8jMAkhQH_aQr5Obd1rSKd8u4
Message-ID: <CAPnjgZ0NWtR6zXmq7fZtYk_DWGv1tpYY8t5x4Pn7UPaPj9-XFQ@mail.gmail.com>
To: Simon Glass <sjg@chromium.org>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Mario Six <mario.six@gdsys.cc>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] configs: sandbox: activate DEBUG_UART
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

On Fri, 27 Nov 2020 at 03:49, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Add CONFIG_DEBUG_UART=y for all sandbox defconfig
> as it is already done in sandbox_defconfig.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  configs/sandbox64_defconfig        | 1 +
>  configs/sandbox_flattree_defconfig | 1 +
>  configs/sandbox_spl_defconfig      | 1 +
>  3 files changed, 3 insertions(+)

Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot-dm/next, thanks!
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
