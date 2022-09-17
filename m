Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7985BB9C2
	for <lists+uboot-stm32@lfdr.de>; Sat, 17 Sep 2022 19:27:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C35FC03FC6;
	Sat, 17 Sep 2022 17:27:23 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C78D1C035A5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 17 Sep 2022 17:27:22 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-345528ceb87so294703997b3.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 17 Sep 2022 10:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date;
 bh=YDUvf1fwLM/UATJLlP54Bin990us17fbwSG1NdLSZco=;
 b=M6jeFTin2N/CIczyE7sL7XwFgBtYlfh5RiC181OFaeLz1d40doPh+lqdfc8H8tDdcm
 +xC7XNmcggJhP2wHOfGDPm8GbIoP6NhCV/kjJtEudqsHwOzo91KoQ77s6Hm65QNRLSMz
 wR/B+Y2QSG9YL0/iuY4vxf7cNh6FspRl3NRXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date;
 bh=YDUvf1fwLM/UATJLlP54Bin990us17fbwSG1NdLSZco=;
 b=nFxttq6DZqTMAhW5u668tIPokpFEdFWPBWVyhutVNF5RQx/KNQttaU+QDUXGOdGWIs
 McAKKsuvoh5xXsSo/SEZBqJkWzDta3rpqSoha8gqys0MbeE7FlkAE9lxwIjcX2lD1Iez
 1NasmwPSKiMRhBIOdoelPvg+t59KNUrvTgGQWKemA4j283fsvW0P4LzfCG4N2Cm98zLs
 miShGnVn/5gU0eRWul3cLaPrKeLAK7roGhBbbLGV4b/LQLcfT8AZnLd6nK02uZf29RiD
 KLcl9XNDjYSO899IMBjltXS2qupU95Ko4YIkEMwkfrWsa/wyL61RAdAxNR7QJee2YCIn
 Nlwg==
X-Gm-Message-State: ACrzQf1wUwTMbYTAXN5LeGEXDL9T3dzw1mfbt2OJnHDLa9GkKKerbRDy
 D7DZa0VmpJOZ903F46U5+/YzdyS86S7s7k0hBj5XHQ==
X-Google-Smtp-Source: AMsMyM66mh6LP6pHtwtWLsrE2MwRFArYCy3lRwD4yffz+khWIAXapF4TbpUz4Z2Xp129H4qzpPyzDokfAPeSZnk764w=
X-Received: by 2002:a81:1246:0:b0:345:222d:d994 with SMTP id
 67-20020a811246000000b00345222dd994mr8660990yws.423.1663435641533; Sat, 17
 Sep 2022 10:27:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220917082550.74511-2-sjg@chromium.org>
 <20220917105204.GA5873@laputa>
In-Reply-To: <20220917105204.GA5873@laputa>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 17 Sep 2022 11:27:09 -0600
Message-ID: <CAPnjgZ2X5RZLqC_j5=xyhoCLJDJLLZ4Z5sav0RHdhV+EkHnYsw@mail.gmail.com>
To: AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Simon Glass <sjg@chromium.org>, 
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Tom Rini <trini@konsulko.com>, 
 Anastasiia Lukianenko <vicooodin@gmail.com>, Bin Meng <bmeng.cn@gmail.com>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Jaehoon Chung <jh80.chung@samsung.com>, 
 Joe Hershberger <joe.hershberger@ni.com>, Lukasz Majewski <lukma@denx.de>, 
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, Marek Vasut <marex@denx.de>, 
 Masahisa Kojima <masahisa.kojima@linaro.org>,
 Max Merchel <Max.Merchel@tq-group.com>, 
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, 
 Oleksandr Suvorov <oleksandr.suvorov@foundries.io>, 
 Oleksii Bidnichenko <oleksii.bidnichenko@toradex.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Peng Fan <peng.fan@nxp.com>, 
 Ramon Fried <rfried.dev@gmail.com>, Ricardo Salveti <ricardo@foundries.io>, 
 Sean Anderson <sean.anderson@seco.com>, Stefan Roese <sr@denx.de>, 
 "Ying-Chun Liu (PaulLiu)" <paul.liu@linaro.org>, schspa <schspa@gmail.com>, 
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v3 1/1] blk: Rename if_type to uclass_id
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

Hi Takahiro,

On Sat, 17 Sept 2022 at 04:52, AKASHI Takahiro
<takahiro.akashi@linaro.org> wrote:
>
> On Sat, Sep 17, 2022 at 02:25:50AM -0600, Simon Glass wrote:
> > Use the word 'uclass' instead of 'if_type' to complete the conversion.
>
> NAK.
> You seem to have missed out some of my comments.
> See:
> https://lists.denx.de/pipermail/u-boot/2022-September/494583.html
> (against efi_api.h, efi_device_path.c, efi_device_path_to_text.c and efi_net.c)

OK yes I missed that, sorry.

I sent a new version.

Also, are you planning to do another series to better integrate EFI
with driver model?

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
