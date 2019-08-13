Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 779368B43A
	for <lists+uboot-stm32@lfdr.de>; Tue, 13 Aug 2019 11:34:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25249C35E01
	for <lists+uboot-stm32@lfdr.de>; Tue, 13 Aug 2019 09:34:33 +0000 (UTC)
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 19629C36B3F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Aug 2019 09:34:29 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id g17so19036928otl.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Aug 2019 02:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l+V1tftdbL1UYTHC67nGCBwyBDie/TxnKom3MW++ElY=;
 b=SltsuY0zWXgXvjnsFSxv/uMNueCEQJCDCvsCl+tNDiAEIEFKl2bZ4FPCB66i2GPlWB
 bU+fD/BtmPIjJUBWsrxxLP84t/CjC6FoVAowj2nSscsZZlbMW0Emp3vQ0n5TmZ0oXb5a
 SUg/qmfF8Gmq7kc7AAkURHx9HW4s9uqGEO/cc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l+V1tftdbL1UYTHC67nGCBwyBDie/TxnKom3MW++ElY=;
 b=ipKYUAOkSZAmhcqgnMysOBZLE3+4EGivxkddkloJtSMJJ7GBxn7BkkPx84ackprZ2a
 pRNTa6A0H8NdTBu30/6R3XrKEdSl9wAek7zw68XXTCkXzMhBjzV3SatOMZ9VOVxLFrtA
 HgeSjQ0jBiOsI8ZxmHM9nWYVtItNxnknOzgNz1rlz79NYXn0HB1qVN2MolJa4Wsl0jKc
 AYqDk5Revr7DwNVnU0NbKa8vmNPu4dPyYZXNhQqWbzEWrSMF5qAvvzx0kYUZ4OWwJhRm
 pDKxTC0ZIkNw2gZWaOkUNHSlEKwMbBoS1gDDgcrr3EN5eQKgGq75WNSOxUfbpcJvBHRc
 EP0w==
X-Gm-Message-State: APjAAAWtegHfIbw76RMbuxmixMoiscRPcD9B7KTzpGcT6lvIwV/XcG5e
 GRbTZuDJG2nmOm3HpyxhDOv1sJflW3jU8WIrDfGwHg==
X-Google-Smtp-Source: APXvYqxLkU60p7psuStWl7R+7zJMsCp4bATLed+wj7TsT/60lIb8nnaVD/1TfgIl8cqZA9ZaZn3aQy3V8gV5PWpada8=
X-Received: by 2002:a9d:7e83:: with SMTP id m3mr10019881otp.356.1565688868335; 
 Tue, 13 Aug 2019 02:34:28 -0700 (PDT)
MIME-Version: 1.0
References: <1564651375-26779-1-git-send-email-patrick.delaunay@st.com>
In-Reply-To: <1564651375-26779-1-git-send-email-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 13 Aug 2019 03:34:14 -0600
Message-ID: <CAPnjgZ3AA2QosmsN20XkLi-79Y-XYw8NqTGRzv5tJN6EHgL7gA@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PATCH 1/2] dm: Tidy up dump output when there
	are many devices
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

On Thu, 1 Aug 2019 at 03:24, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> At present the 'Index' column of 'dm tree' assumes there is
> two digits, this patch increase it to 3 digits.
>
> It also aligns output of 'dm uclass', assuming the same 3 digits index.
>
> The boards with CONFIG_PINCTRL_FULL activated have one pinconfig
> by pin configuration, so they can have more than 100 devices
> pinconfig (for example with stm32mp157c-ev1 board we have
> 106 pinconfig node).
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> stm32mp157c-ev1 trace before the patch
>

Reviewed-by: Simon Glass <sjg@chromium.org>

But please do check that this does not break 'make qcheck' as I
thought there were tests for this?

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
