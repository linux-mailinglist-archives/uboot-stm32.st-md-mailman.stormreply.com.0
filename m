Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A878314B81
	for <lists+uboot-stm32@lfdr.de>; Tue,  9 Feb 2021 10:27:43 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18969C57B54;
	Tue,  9 Feb 2021 09:27:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53CCBC57B53
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Feb 2021 09:27:41 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1199RHBs011024; Tue, 9 Feb 2021 10:27:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=cN94vo6bWGNwS2wQgFbnHEVvcHPmtGgbYkZ2rMe+MIc=;
 b=3DK3pcmvA+PMQM1tMlgmRWS3yHjseJq1owGWvfmK23nxI+fgBGIJebPg66C+6s+3R5yF
 zw3DjU1vBsKbkotF0+e3W5mekaCjSwfdEf+XFQ9dm3aJgWeF1d/CnDHzE4gApRXuic4o
 5uk0bBw01wc+y1HCUgGO5sXCDsJDn/hOfbh8Mm4QltOw5QXubqVWjkcz+gI9Q6GrKygt
 mqoT8hhtr2uhXwOWxnEvZJlad8PhaSQnkBogne9RDCMkDJ+wEOTGtuBM5mYl7Bng67YY
 QH5QeqMQjHw351T8UaGie+6d1fRLLu83r5AhPzDjPdQohO1JU3jwKFYNnOkEQ3es2jHy PA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36hrf77jqd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Feb 2021 10:27:40 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 57C3810002A;
 Tue,  9 Feb 2021 10:27:38 +0100 (CET)
Received: from Webmail-eu.st.com (gpxdag2node6.st.com [10.75.127.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4C09421FEBE;
 Tue,  9 Feb 2021 10:27:38 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.116) by GPXDAG2NODE6.st.com
 (10.75.127.70) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 9 Feb
 2021 10:27:37 +0100
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20210120124340.23612-1-patrice.chotard@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <757878cf-10c2-5d50-f515-a88d88d62ec4@foss.st.com>
Date: Tue, 9 Feb 2021 10:27:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210120124340.23612-1-patrice.chotard@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.116]
X-ClientProxiedBy: GPXDAG3NODE6.st.com (10.75.127.73) To GPXDAG2NODE6.st.com
 (10.75.127.70)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-09_02:2021-02-09,
 2021-02-09 signatures=0
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

Hi,

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

Applied to u-boot-stm/master, thanks!

Regards

Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
