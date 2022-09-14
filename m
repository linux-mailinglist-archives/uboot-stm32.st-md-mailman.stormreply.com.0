Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFC75B8DE2
	for <lists+uboot-stm32@lfdr.de>; Wed, 14 Sep 2022 19:10:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46B76C0D2BF;
	Wed, 14 Sep 2022 17:10:13 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com
 [209.85.160.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 762DCC0D2BB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Sep 2022 17:10:12 +0000 (UTC)
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-1280590722dso42803896fac.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Sep 2022 10:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=Dv+9kPVmHcwkCDVNTd5Y8Sq2VQTLFIoB5KMo7wgm8BQ=;
 b=h+qbTQnSLzV+FUqf4ylYz4veN0svCdnAaI7BVKseea1w0cfdI0hGOfCm/9JoFFUfjS
 u+dpErT9IXTn0ZaVaLTs2Gb5irCxJdyaQpX2mJ3ksjqe+T5seOYfn3+Twi5GM/PlJOpf
 fjY3k0fSJC5vkMAIKKu5bhxaCczhLhOV/QFc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=Dv+9kPVmHcwkCDVNTd5Y8Sq2VQTLFIoB5KMo7wgm8BQ=;
 b=6mOHOlbrRi6HUqB8LWqQNXHZUEaer5ycOhaJuNatEJJ002EdE1FHLp7OTpWuabLSr9
 OHdD14M7qOR7kxaWHq4cw+AztoDT/zZHPmDZQsxfhEIHjrVpawYHXi3AurEaFLZeImxm
 bWb7Zpu7NLesNYCZJXiTqC/5ZANdJ864N/KWcmD3Ro9sYMvijc1BG9+6wqfKU6tmXMni
 McodSO5tvU6SG6bVfF7S+cYq8sxWli120Go+BC0tWE1wxuN+a9aY4wCDbwWC59JYgSQr
 HCop+mCf4Q8/BjooQVywuFdvq2Sid5unZDkumxWUqkvK7w3mMQiS9lSs3yZEa2MKz/wZ
 Hhhw==
X-Gm-Message-State: ACgBeo0Zs9oexzykq9z1Xp1RAmjG/WcNT4eP4PtASAxhUzUh4R6O6Gw4
 DplqHmYcvdqewMDSxZqkDFsanlEVjY36jxUv0QwjyA==
X-Google-Smtp-Source: AA6agR5agde7NvQ9niFtTVQmCP45w5CCWNhfGRrOIJXvztDqu0FlC7gqqFa1z/X74rOqPmASjRAzv8U88xptJf+BLM4=
X-Received: by 2002:a05:6870:390b:b0:127:42b1:e5d0 with SMTP id
 b11-20020a056870390b00b0012742b1e5d0mr3096778oap.64.1663175411059; Wed, 14
 Sep 2022 10:10:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220812013503.1724919-1-sjg@chromium.org>
 <20220812013503.1724919-25-sjg@chromium.org>
 <20220913160322.GA2036901@bill-the-cat>
In-Reply-To: <20220913160322.GA2036901@bill-the-cat>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 14 Sep 2022 11:09:57 -0600
Message-ID: <CAPnjgZ383byJYKALTXvpHMcTVeinFvGLxD60eBfqUvL9ax8uRg@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: Peng Fan <peng.fan@nxp.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Oleksii Bidnichenko <oleksii.bidnichenko@toradex.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Masahisa Kojima <masahisa.kojima@linaro.org>,
 "Ying-Chun Liu \(PaulLiu\)" <paul.liu@linaro.org>, Stefan Roese <sr@denx.de>,
 Marek Vasut <marex@denx.de>, Markus Niebel <Markus.Niebel@ew.tq-group.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Sean Anderson <sean.anderson@seco.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Lukasz Majewski <lukma@denx.de>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Ricardo Salveti <ricardo@foundries.io>, Ramon Fried <rfried.dev@gmail.com>,
 schspa <schspa@gmail.com>, Oleksandr Suvorov <oleksandr.suvorov@foundries.io>,
 Aswath Govindraju <a-govindraju@ti.com>,
 Max Merchel <Max.Merchel@tq-group.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Anastasiia Lukianenko <vicooodin@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v2 24/24] blk: Rename if_type to uclass_id
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

Hi Tom,

On Tue, 13 Sept 2022 at 10:03, Tom Rini <trini@konsulko.com> wrote:
>
> On Thu, Aug 11, 2022 at 07:35:03PM -0600, Simon Glass wrote:
>
> > Use the word 'uclass' instead of 'if_type' to complete the conversion.
> >
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > ---
> >
> > Changes in v2:
> > - Use conv_uclass_id() instead of the confusing uclass_id_to_uclass_id()
>
> So, for this series, 1 through 22 apply cleanly (one easy fixup
> required), and 23/24 appears to be applied already. But large chunks of
> this patch do not apply to lib/efi_loader/efi_disk.c and it's unclear
> what I should do here. Should I just apply 1-22 of this series? Or do
> you expect to v3 this? Thanks!

Yes please apply 1-22. For 24 I will then rebase on -next , address
the comments and resend.

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
