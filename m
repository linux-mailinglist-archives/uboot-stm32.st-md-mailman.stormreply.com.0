Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F8E697802
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Feb 2023 09:19:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA442C6B445;
	Wed, 15 Feb 2023 08:18:59 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8CA13C6A5F3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Feb 2023 10:52:46 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id c1so12922433edt.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Feb 2023 02:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xQFWFq0uRbdimHuyFn4A1V532ugP0k/S0ZTSejwM9s8=;
 b=gDt7CivNbfrnifW2MQCtew0l4nXyIXXTmGNDDaXOZJw6BHD/mOhUZKPtdRa1Uyz24r
 vt44HjWQ3LYbisb20zKg3Blc13UpontUntWaYaWTdUOx8axEmkGg5e9v4+mLFq+dKyVL
 XPxgBVhJVKWjUgYV+mt2aGI9DLhgIfwDsfRcQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xQFWFq0uRbdimHuyFn4A1V532ugP0k/S0ZTSejwM9s8=;
 b=R0KgOZ8Pw9rNGfhJLTVqsqSe99x8zv2q+WH2pNv+8kE/Q6bNhm13N9WlRu3ZxURHv7
 0wofk1wC7EvxeJ6GUECZXwK1Ex/3OM+ps+aDI8lEuNqYfEg7axb33Bne6GfwVz5alFor
 bEZxrF2JlKdYlfND/0U3ESv9RNT4tlMs9uOXrGwpjlZZbG0tXrvPs/zCU8/gNA1qF/ee
 7jorvl6im5etd1ikhNMK8CBI4Ge4VRluFuaLweUPgk1gd4j9m5bhcaeEuff3Uq4X8Kga
 qYhALXtogLetZjIC72M/iRFkjiaLtsp10Fi3eOQQ+F/NzvgvXaPbd+jUE9O/NWTIuC+R
 VBeg==
X-Gm-Message-State: AO0yUKXaXW2s+Y9zEHbHyspCrBhlUduEWDjyqYbcnsA3lM2hjgSOLaJs
 Nt+CSmzGEO8yhC5vDfTlEgwIHBsyOsL7wP9NrEsYrw==
X-Google-Smtp-Source: AK7set/hXIDlzYSJgQmXrmx+ysv26PnaqDfoM3qVeDerGvNHTPJ4rIcFI2ap850BI1WxQI6Ql96LdOKF+zNiPKyOiFg=
X-Received: by 2002:a50:8a9b:0:b0:4ac:bb37:a501 with SMTP id
 j27-20020a508a9b000000b004acbb37a501mr696802edj.1.1676371966013; Tue, 14 Feb
 2023 02:52:46 -0800 (PST)
MIME-Version: 1.0
References: <20230213173005.913823-1-patrice.chotard@foss.st.com>
 <0dba65d9-6415-569f-b4fb-34b10b1c710d@kontron.de>
In-Reply-To: <0dba65d9-6415-569f-b4fb-34b10b1c710d@kontron.de>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Tue, 14 Feb 2023 11:52:34 +0100
Message-ID: <CAOf5uw=a0op1ZCe0wGUXnJbMq64=LfqvX3N4zE5pOq5Y6o1Z-Q@mail.gmail.com>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
X-Mailman-Approved-At: Wed, 15 Feb 2023 08:18:58 +0000
Cc: Boris Brezillon <bbrezillon@kernel.org>, Simon Glass <sjg@chromium.org>,
 u-boot@lists.denx.de, U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>, Stefan Roese <sr@denx.de>,
 Jagan Teki <jagan@openedev.com>, Peter Pan <peterpandong@micron.com>
Subject: Re: [Uboot-stm32] [PATCH] mtd: spinand: Fix display of unknown raw
	ID
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

Hi

On Tue, Feb 14, 2023 at 9:14 AM Frieder Schrempf
<frieder.schrempf@kontron.de> wrote:
>
> On 13.02.23 18:30, Patrice Chotard wrote:
> > In case ID is not found in manufacturer table, the raw ID is
> > printed using %*phN format which is not supported by lib/vsprintf.c.
> > The information displayed doesn't reflect the raw ID return by the
> > unknown spi-nand.
> >
> > Use %02x format instead, as done in spi-nor-core.c.
> >
> > For example, before this patch:
> >   ERROR: spi-nand: spi_nand flash@0: unknown raw ID f74ec040
> > after
> >   ERROR: spi-nand: spi_nand flash@0: unknown raw ID 00 c2 26 03
> >
> > Fixes: 0a6d6bae0386 ("mtd: nand: Add core infrastructure to support SPI NANDs")
> >
> > Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>
> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>

Acked-by: Michael Trimarchi <michael@amarulasolutions.com>

-- 
Michael Nazzareno Trimarchi
Co-Founder & Chief Executive Officer
M. +39 347 913 2170
michael@amarulasolutions.com
__________________________________

Amarula Solutions BV
Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
T. +31 (0)85 111 9172
info@amarulasolutions.com
www.amarulasolutions.com
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
