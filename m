Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A44785BD8ED
	for <lists+uboot-stm32@lfdr.de>; Tue, 20 Sep 2022 02:53:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E693C03FD5;
	Tue, 20 Sep 2022 00:53:20 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 36E1EC03FCD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Sep 2022 00:53:19 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id bh13so974955pgb.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Sep 2022 17:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date; bh=FfRTT1rhuerxdVZMmh7QhGiLSLxDfr0hxwFkLfXd8gg=;
 b=GOLGieKnu4T55h0rE+7iw7xETwj89wpK7c64TPH8flAmbCp4CKxd0NJBwUCDePKFKz
 Y+0CT73OUJeOtb+oiuC7pLOfQ2PAXO4cYPM7MhrVTECrekoRwWcSjsYGLwCxDKhVNdX9
 RPyPJuUkmRRpLmhCcR8NAAR0TMtPBIcQIG2XaZCNp83b9sr9W44iBcCmq2Wx20fkuudL
 jUEybiLTQsG6c/3DIBe8Xv2D+1RIm/2JlhR5TuOgFHHePrQIZQPBLGRbU9nP4+WvBv7a
 o6xcDK0SyGI6whK+OHokMvf9F0rgmGE3ZUj4gc4bu5fFZBN2eJLPjQq5Xmq5Ut6zCD70
 xthQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=FfRTT1rhuerxdVZMmh7QhGiLSLxDfr0hxwFkLfXd8gg=;
 b=QTIBVYpRCllpyj9q5UptkECojT7tbrYt4m8FyQn5VdAe4gPr6AOZbq+UKsdgXSCr6h
 VDBrNa24HJwrXmRpR2BneGd0M1Sv0+XnHQNi0+cpjOEvlWbCxCBtYd/gOlQKoxXgmGc3
 QL9WpZbwlRhyKwwB5J+YY6wrNi7qWxeXnaMcUJ/In9Ur6IVuwzueu3TGnmDopi6k8C1J
 tjc6U04WgzxFMzk7EvREPAWdzRk58AOhQZkpbipWP+5OBqgC4/d+u5F/5HeElIgWVrPk
 x6afLB7IcFEM/81wfxd8dS4jeGmBfHt6xYbUrnA0jmey6PPig/IRRebafl1CnRDUvMaq
 3vUA==
X-Gm-Message-State: ACrzQf1isTNyFisUtyKWEAGnkWkwLK8KSlQxT/N9AR7xKtsZJRMOog7m
 HQtnTAlJKmEFxPE8OQWM13sTAA==
X-Google-Smtp-Source: AMsMyM5L6gvsG5m/kmY3zkm2/9CpwtX2bzrTtFqorIJzUF+tbnL2xFd95kD+riAgfDSu+gs//TyVJw==
X-Received: by 2002:a05:6a00:1484:b0:547:89e:272c with SMTP id
 v4-20020a056a00148400b00547089e272cmr21221931pfu.0.1663635197780; 
 Mon, 19 Sep 2022 17:53:17 -0700 (PDT)
Received: from laputa ([2400:4050:c3e1:100:3193:88d4:8925:281a])
 by smtp.gmail.com with ESMTPSA id
 x138-20020a633190000000b0043a279c2472sm2695186pgx.90.2022.09.19.17.53.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 17:53:16 -0700 (PDT)
Date: Tue, 20 Sep 2022 09:53:08 +0900
From: AKASHI Takahiro <takahiro.akashi@linaro.org>
To: Simon Glass <sjg@chromium.org>
Message-ID: <20220920005308.GA43615@laputa>
Mail-Followup-To: AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Simon Glass <sjg@chromium.org>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Tom Rini <trini@konsulko.com>,
 Anastasiia Lukianenko <vicooodin@gmail.com>,
 Bin Meng <bmeng.cn@gmail.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Lukasz Majewski <lukma@denx.de>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Marek Vasut <marex@denx.de>,
 Masahisa Kojima <masahisa.kojima@linaro.org>,
 Max Merchel <Max.Merchel@tq-group.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Oleksandr Suvorov <oleksandr.suvorov@foundries.io>,
 Oleksii Bidnichenko <oleksii.bidnichenko@toradex.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Peng Fan <peng.fan@nxp.com>, Ramon Fried <rfried.dev@gmail.com>,
 Ricardo Salveti <ricardo@foundries.io>,
 Sean Anderson <sean.anderson@seco.com>, Stefan Roese <sr@denx.de>,
 "Ying-Chun Liu (PaulLiu)" <paul.liu@linaro.org>,
 schspa <schspa@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
References: <20220917082550.74511-2-sjg@chromium.org>
 <20220917105204.GA5873@laputa>
 <CAPnjgZ2X5RZLqC_j5=xyhoCLJDJLLZ4Z5sav0RHdhV+EkHnYsw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPnjgZ2X5RZLqC_j5=xyhoCLJDJLLZ4Z5sav0RHdhV+EkHnYsw@mail.gmail.com>
Cc: Peng Fan <peng.fan@nxp.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Oleksii Bidnichenko <oleksii.bidnichenko@toradex.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Masahisa Kojima <masahisa.kojima@linaro.org>,
 "Ying-Chun Liu \(PaulLiu\)" <paul.liu@linaro.org>, Stefan Roese <sr@denx.de>,
 Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Sean Anderson <sean.anderson@seco.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Lukasz Majewski <lukma@denx.de>,
 Jaehoon Chung <jh80.chung@samsung.com>, Ricardo Salveti <ricardo@foundries.io>,
 Ramon Fried <rfried.dev@gmail.com>, schspa <schspa@gmail.com>,
 Oleksandr Suvorov <oleksandr.suvorov@foundries.io>,
 Max Merchel <Max.Merchel@tq-group.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Anastasiia Lukianenko <vicooodin@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>
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

On Sat, Sep 17, 2022 at 11:27:09AM -0600, Simon Glass wrote:
> Hi Takahiro,
> 
> On Sat, 17 Sept 2022 at 04:52, AKASHI Takahiro
> <takahiro.akashi@linaro.org> wrote:
> >
> > On Sat, Sep 17, 2022 at 02:25:50AM -0600, Simon Glass wrote:
> > > Use the word 'uclass' instead of 'if_type' to complete the conversion.
> >
> > NAK.
> > You seem to have missed out some of my comments.
> > See:
> > https://lists.denx.de/pipermail/u-boot/2022-September/494583.html
> > (against efi_api.h, efi_device_path.c, efi_device_path_to_text.c and efi_net.c)
> 
> OK yes I missed that, sorry.
> 
> I sent a new version.
> 
> Also, are you planning to do another series to better integrate EFI
> with driver model?

No, I'm not.

-Takahiro Akashi

> Regards,
> Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
