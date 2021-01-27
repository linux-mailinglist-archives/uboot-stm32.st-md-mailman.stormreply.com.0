Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D06E305DD2
	for <lists+uboot-stm32@lfdr.de>; Wed, 27 Jan 2021 15:06:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4D35C57182;
	Wed, 27 Jan 2021 14:06:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7237FC5662E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Jan 2021 14:06:03 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10RDvCMJ004333; Wed, 27 Jan 2021 15:06:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=gdq1cOhywBi8djuo0xkTH1XJKut8l1zfycC8L7YoqXM=;
 b=w61WKhj9o35aFWlc44JWePfVwuWuh03H4pZQ2WehbijFCn91q5EO/92IfD9ovTJ7yEZn
 o7DrT7mZVT8nHlzyDtwb1upkxVa2hYdXhGXLBslitnSB3SM2pmGhdLNXotTdu9dYuwJu
 X1cRpTJdvPDnXClHA0SobBM08DDbgBSachQBZbv35P5HX41QCsKhTklaAPfqeux+Z5Qw
 yA7KmYyMCx1F5j1PHC8mroLt34Em2jTJXIVIoMgqZswUkJiJ8kcnQOpKht9VW/OMYDuC
 QzSn9UhdYDR0YTXLphus84HR23K+NYb+CpNsaJOF/N6QuHzCyvNgujxtItc8ENByFKlS Hw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3689te0rem-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jan 2021 15:06:01 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9829B10002A;
 Wed, 27 Jan 2021 15:06:00 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8B726245C61;
 Wed, 27 Jan 2021 15:06:00 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.45) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 27 Jan
 2021 15:06:00 +0100
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20210120124340.23612-1-patrice.chotard@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <921d6bfd-8534-2aaa-9555-44bb1b2e4ce1@foss.st.com>
Date: Wed, 27 Jan 2021 15:05:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210120124340.23612-1-patrice.chotard@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-27_05:2021-01-27,
 2021-01-27 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] pinctrl: stmfx: Fix pin configuration
	issue
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

Hi Patrice,

On 1/20/21 1:43 PM, Patrice Chotard wrote:
> pin-controller pin's name must be equal to pin's name used in device
> tree with "pins" DT property.
>
> Issue detected on stm32mp157c-ev1 board with goodix touchscreen.
> In DT, the goodix's pin is declared in DT with the node:
>
>          goodix_pins: goodix {
> 		pins = "gpio14";
> 		bias-pull-down;
> 	};
>
> Whereas in stmfx pin-controller driver, pin's name are equal to
> "stmfx_gpioxx" where xx is the pin number.
> This lead to not configure stmfx's pins at probe because pins is
> identified by its name (see pinctrl_pin_name_to_selector() in
> pinctrl-generic.c) and stmfx pin "gpio14" can't be found.
>
> To fix this issue, come back to the original stmfx pin's name.
>
> Revert "pinctrl: stmfx: update pin name"
>
> This reverts commit 38d30cdcd65c73eeefac5efa328ad444a53b77dd.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Tested-by: Patrick DELAUNAY <patrick.delaunay@st.com>
> ---
>
>   drivers/pinctrl/pinctrl-stmfx.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>

Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks

Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
