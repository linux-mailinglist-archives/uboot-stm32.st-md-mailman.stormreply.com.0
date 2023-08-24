Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3289A7871ED
	for <lists+uboot-stm32@lfdr.de>; Thu, 24 Aug 2023 16:41:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE052C6B44F;
	Thu, 24 Aug 2023 14:41:34 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60701C6A61A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Aug 2023 14:41:33 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-99bc9e3cbf1so207664566b.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Aug 2023 07:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692888093; x=1693492893;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bAArZxilMdafYN0YYrcuIx+9R9cfa4JM+gLl2a5oPxI=;
 b=YDjDtIHmi4IGsrIFuYwwGfY8DweNuh9UPeUrn8gp8UyiODJiTnlUIkXj/E4N9Mjqgo
 /iPqtHceyICMJ2SxTif7u1x8Hkilfq3GaLwMIVbRin+j1/ShNFdbZ2xYsRKhtlbWvw3E
 5NSLvElCO0h7XqwAoA9WxEfvH0qfYx2FQyfVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692888093; x=1693492893;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bAArZxilMdafYN0YYrcuIx+9R9cfa4JM+gLl2a5oPxI=;
 b=KxVWbw3YNUN2AVEAKcBJ46UL3ZPXGRFvWBwcQu8+iuTQ55n4NDkC365YIfcWw5uclJ
 XYtntdPj9jUGmAicRd76DqBc5uoTBf8XaE8YOdO3Kis59vnQMbkDqUhvZM2p1B1tnsdD
 W1HuBiWh5q0OACEMclOwOs9SUZ5FzEkrd+frO1jZ9qubQ49zD793WPutgQlbX88A+J1L
 HS1TogMiY2xRhaL7NLDU1dMFZUOCPPJGtlo/IPPJfnk6tpuHsOFGX3k7oIfSPoV0Sl1I
 n2YFNQCe4Lxc7fw+/je1ZZdeVsIUixhPoWQKHGj5VB34J1KFz/Htm8UBEGMl5crICav1
 ZSUg==
X-Gm-Message-State: AOJu0YzERv7T4cAKJdqKSpyiQRhUJFE98Pn5QgY048Ew860S7KjLQh+9
 XFz1BK1ht1TxT+MFkcPFA8N3nbe7Gyb5pni9p/oVyA==
X-Google-Smtp-Source: AGHT+IGuUVu8B6RMBQO5SAHlZSO+rI3Prp0pji/F3INchAoUk+f8v7CkO3gSwAnfLQgjQIcdm0T3/N0dTswy0036m6E=
X-Received: by 2002:a17:907:da1:b0:9a2:248f:aac with SMTP id
 go33-20020a1709070da100b009a2248f0aacmr1059631ejc.16.1692888092555; Thu, 24
 Aug 2023 07:41:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230824030304.1555547-1-sjg@chromium.org>
 <66f15744-0b0b-743f-8ad3-8448d78812f6@ti.com>
In-Reply-To: <66f15744-0b0b-743f-8ad3-8448d78812f6@ti.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 24 Aug 2023 08:41:19 -0600
Message-ID: <CAPnjgZ3MFkrR6qNTqgF1AMHun0DrMK2RfZ_6X824eczBXyEyNA@mail.gmail.com>
To: Neha Malcom Francis <n-francis@ti.com>
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Peng Fan <peng.fan@nxp.com>, Philippe Reynes <philippe.reynes@softathome.com>,
 Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
 Jonas Karlman <jonas@kwiboo.se>, Nishanth Menon <nm@ti.com>,
 Vikas Manocha <vikas.manocha@st.com>, Michael Walle <michael@walle.cc>,
 Ivan Mikhaylov <fr0st61te@gmail.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@dh-electronics.com,
 uboot-stm32@st-md-mailman.stormreply.com, Kamil Lulko <kamil.lulko@gmail.com>,
 Dillon Min <dillon.minfei@gmail.com>, "Raghavendra, Vignesh" <vigneshr@ti.com>
Subject: Re: [Uboot-stm32] [PATCH 0/6] Attempt to enforce standard
	extensions for build output
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

Hi Neha,

On Thu, 24 Aug 2023 at 06:26, Neha Malcom Francis <n-francis@ti.com> wrote:
>
> Hi Simon
>
> + Vignesh, Nishanth to comment on this as well
>
> On 24/08/23 08:32, Simon Glass wrote:
> > In this early stage of using binman to produce output files, we are mostly
> > seeing people using common extensions such as '.bin' and '.rom'
>
> [...]
>
> > The fact that the .pem files are at the top level means that they are
> > output images, which surely is not intended. They should be buried in the
> > image description, at a lower level, as part of something else.
> >
> > So please take a loke at the above and see if the binman descriptions can
> > be reworked slightly to follow these new rules.
> >
>
> I think this can work... but few concerns.
>
> 1. Our output binaries also include <image>.bin_unsigned, would extensions that
> aren't "standard" be added to the list if they are truly output binaries? If
> not, changing names for them may be a long stretch (pinging Vignesh and Nishanth
> to comment here).

How about changing them to image-unsigned.bin ? That is a convention I
am trying to follow...so we have the file type last.

>
> 2. Can it be an option to not enforce this, to support users that may make use
> of the intermediate binaries?

This does not apply to sections within an image, which can still
produce files. But those files won't be preserved by buildman unless
they have a supported extension.

>
> Also if we do move forward with this, we will need to sync to make sure that the
> changes to the affected boards come through as well.

Yes.

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
