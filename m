Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B550AED029
	for <lists+uboot-stm32@lfdr.de>; Sun, 29 Jun 2025 21:35:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3ADCC36B35;
	Sun, 29 Jun 2025 19:35:05 +0000 (UTC)
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7C9E1C36B31
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 29 Jun 2025 19:35:05 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4bVfdL6vmfz9sd6;
 Sun, 29 Jun 2025 21:35:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1751225703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R9OmdJ7QIuvqT9VedjyBuRfdgJjfpi16FiqsdO4LiQo=;
 b=GFnGLELJUAqtROnAO3q86+dKj8VNLAKUnyJzbQvGiCqUoorasMIGRNAeMaFFvEnEABna6n
 XSstY0LK6J2AWKnCnCV0mDt28ByDuz9xfBnJRl4TszFcXe233Y6amCcNia/Iqo8KMn1CfI
 5Lt52tSitDfsbnyPculP34Rej5gsDDryTKIPg2V+0cfkOihNAXxcju68fIev5wh2CxqLIx
 HsIw1/si+C+GaswEIQWF4pWRb5BZdtTfAKrge/pOOwOw3D3CfrorRJSyYpDJ6+82xIRFgE
 4F5Bg5fVYKGfOBntwy+0akWBeOLdcEoyN7GhoiKgBNViCIWcv4DNx/SGHYd/zQ==
Message-ID: <b0905e50-5db0-4e88-8a8d-f7f7daa9de94@mailbox.org>
Date: Sun, 29 Jun 2025 21:35:00 +0200
MIME-Version: 1.0
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20250512172149.150214-1-marek.vasut@mailbox.org>
 <20250512172149.150214-7-marek.vasut@mailbox.org>
 <c6d04a79-f36a-4eaf-a4f0-06067307cc54@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <c6d04a79-f36a-4eaf-a4f0-06067307cc54@foss.st.com>
X-MBO-RS-ID: edebcf2673f7d3a8445
X-MBO-RS-META: xz6qyw6pa9zti9r7x4efgmwx3we7fto7
Cc: Tom Rini <trini@konsulko.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>, u-boot@dh-electronics.com,
 Cheick Traore <cheick.traore@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 uboot-stm32@st-md-mailman.stormreply.com, Simon Glass <sjg@chromium.org>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Pascal Zimmermann <pzimmermann@dh-electronics.com>
Subject: Re: [Uboot-stm32] [PATCH 06/10] ARM: dts: stm32: Add
	stm32mp13-ddr.dtsi template
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

On 6/3/25 4:22 PM, Patrick DELAUNAY wrote:

Hi,

>> +++ b/arch/arm/dts/stm32mp13-ddr.dtsi
>> @@ -0,0 +1,49 @@
>> +// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
> 
> 
> For new STM32MP file avoids to use the Deprecated License Identifiers 
> (GPL-2.0+ / GPL-2.0)
> 
> reference=
> 
> +https://spdx.dev/learn/handling-license-info/
> 
> + https://spdx.org/licenses/
> 
> 
> =>
> 
> SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause
> 
> 
>> +/*
>> + * Copyright : STMicroelectronics 2018
> 
> 
> This copyright, with year 2018 is strange this file is copied for TF-A 
> file, I think = ./fdts/stm32mp13-ddr.dtsi
How did you arrive at this conclusion ? The content of these two files 
is nothing alike , see e.g. diff output. The stm32mp13-ddr.dtsi is 
derived from stm32mp15-ddr.dtsi, which is where the copyright stems 
from, I can update it to 2018-2025 ?
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
