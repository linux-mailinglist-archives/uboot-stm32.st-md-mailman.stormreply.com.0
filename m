Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7981CA86FB3
	for <lists+uboot-stm32@lfdr.de>; Sat, 12 Apr 2025 22:54:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31157C7128A;
	Sat, 12 Apr 2025 20:54:00 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F803C6DD9F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 12 Apr 2025 20:53:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 004FF10275AD0; 
 Sat, 12 Apr 2025 22:53:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1744491237; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=QsPdZAAxDkf29Zec7IJ8q/PXOXWwNnoGDFfHXYS3FSc=;
 b=S163y2C1XEv/yNlVjAUuzDCstvxXe8ad5LWVSGoPzm1okj0wx3KeA+TxgsMCJUzEDgWtFM
 3mxaZ4sKkGR+Qd56GNc+hU2d/nTyfcjqZvcqyj2bjcEXkYLLKvHaKaTF5MdxP1TwLkvqPM
 RPVFTHGQzsFGWRqbulamf6QlbI35/PIPmX5pJYTziPD6wLw4+B1b4Mz8ALxN4oYZw2/fT5
 Du1u18BRpcw0S/EaSQllERUgsh+OFnJG7PdvziWliYOSYouOVLr4IR+cSRV2AsF7w8q6jl
 2OEEG0d8SStV3lwjFAGvDVW3U7qZsqdIoX0nr+jqwCgPFXcgtQ/gpinD/ZUPUQ==
Message-ID: <4ffec9c5-1faa-4156-825d-c72478eb032d@denx.de>
Date: Sat, 12 Apr 2025 22:53:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20250411092721.331518-1-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20250411092721.331518-1-patrice.chotard@foss.st.com>
X-Last-TLS-Session-Version: TLSv1.3
Cc: Erik Schumacher <erik.schumacher@iris-sensing.com>,
 Tom Rini <trini@konsulko.com>, Greg Malysa <malysagreg@gmail.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Heesub Shin <heesub@gmail.com>,
 Philip Oberfichtner <pro@denx.de>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ramon Fried <rfried.dev@gmail.com>,
 Vasileios Bimpikas <vasileios.bimpikas@analog.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] net: dwc_eth_qos: add support of stm32mp2
	platform
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

On 4/11/25 11:27 AM, Patrice Chotard wrote:
> From: Christophe Roullier <christophe.roullier@foss.st.com>
> 
> Add compatible "st,stm32mp25-dwmac" to manage STM32MP2 boards
> 
> Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
Reviewed-by: Marek Vasut <marex@denx.de>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
