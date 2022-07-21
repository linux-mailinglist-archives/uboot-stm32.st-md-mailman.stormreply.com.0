Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A080E57C218
	for <lists+uboot-stm32@lfdr.de>; Thu, 21 Jul 2022 04:09:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4483EC03FD5;
	Thu, 21 Jul 2022 02:09:08 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2AAFC03FC8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Jul 2022 02:09:06 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 180B383D7F;
 Thu, 21 Jul 2022 04:09:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1658369344;
 bh=b8pinDQqlH59YbU77no0lhUD2k/l5vMPsVHZ6sJLmP0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=us/h9kLY+urZPc0Tdzyr3yam/y3SwQzWn5qhnHMGGW5jgX78uDTyAjKiM+QHoKjbr
 bDaVaKYRGb19NoHeMDXfn0Sxw1i/Uko0wFtoXFDMTwxqrTNdIDME8VgzrsY21AJFgw
 h5wHDlZ0bWrJihRlbHlWxAI0eEpO4rlmLTpyRHQZ1ou+EmKvjoNdMonDQaD4YycFym
 G7/MyRrQEbp3YjHF+/ri26OQc9DIsW0E/x3L2TW6AFEQLJEEJZiuKgLWP/nrKt5qux
 /S/vcGmOD3ZtMXEOFqCu7Qjhwf9ACYUweQI6bFdlaAO9dLGK1vxoFchYUUieQ+de0f
 yObm5kXVdxu8g==
Message-ID: <5d162d1e-fcab-72f0-96e0-1b440fe0270b@denx.de>
Date: Thu, 21 Jul 2022 02:30:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Philip Oberfichtner <pro@denx.de>, u-boot@lists.denx.de
References: <20220704111106.1415208-1-pro@denx.de>
 <20220704111106.1415208-5-pro@denx.de>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220704111106.1415208-5-pro@denx.de>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Tom Rini <trini@konsulko.com>, peng.fan@nxp.com, festevam@denx.de,
 u-boot@dh-electronics.com, Simon Glass <sjg@chromium.org>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, sbabic@denx.de
Subject: Re: [Uboot-stm32] [PATCH 4/4] ARM: stm32: DH: Use common mac
	address functions
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

On 7/4/22 13:11, Philip Oberfichtner wrote:
> To reduce code duplication, let the stm32 based DH boards use the common
> code for setting up their mac addresses.
> 
> Signed-off-by: Philip Oberfichtner <pro@denx.de>

"MAC address" is written in capitals , please fix the lowercase 'mac' 
all over the place  and make it uppercase (except for function names, 
there is should stay lowercase).

Tested-by: Marek Vasut <marex@denx.de>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
