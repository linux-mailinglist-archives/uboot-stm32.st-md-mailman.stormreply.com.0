Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C46A16744
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 Jan 2025 08:22:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF7B5C78018;
	Mon, 20 Jan 2025 07:22:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3ABDC7128A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Jan 2025 07:22:44 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50JK4ZVj027503;
 Mon, 20 Jan 2025 08:22:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 urTjR4HeQI9PA6E0yBARBFQbLoO6zUFQW9Gy2m+dg/U=; b=sY9yG0QwduTMHsfR
 yB+oZAM7BDAXzXHW/Jz//drQ6Sbvn7yt2Zkwt3sR7C1swo8HTkAKlFe1IozOuGmX
 LSkeLKNc41ETN2WOCKFNLdioa9uFvkku9iLxDRXnDiu/iAtAScHSbr0go7aQub8I
 /0YWAWK2sqIvFYhfJ3C+q2N0r56E5E+izvSeS3Klhf6LzjJujraBOTnyT3Vu/frK
 3ehPFCynUb+Jvxf1PXQN4USUeqExJHNMyaG8TnzEZwq1YjEAFx0C4PvWqIzbAdYL
 kKowfyXAQ9Etb7PBmFU9998/Zz5F59QlFRm23gsljc35mkD1MBoHsDOwyt/+6S3T
 MtmX7w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 448pr3b4q6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jan 2025 08:22:35 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5E67C4002D;
 Mon, 20 Jan 2025 08:21:25 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0E9F7273AFC;
 Mon, 20 Jan 2025 08:20:53 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 20 Jan
 2025 08:20:52 +0100
Message-ID: <61342a4d-5790-43a5-a5ca-7ee340edc23b@foss.st.com>
Date: Mon, 20 Jan 2025 08:20:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>, <u-boot@lists.denx.de>
References: <20250116081738.2511223-1-patrice.chotard@foss.st.com>
 <20250116081738.2511223-4-patrice.chotard@foss.st.com>
 <877c6v83ts.fsf@baylibre.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <877c6v83ts.fsf@baylibre.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-20_01,2025-01-16_01,2024-11-22_01
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, Tom Rini <trini@konsulko.com>,
 Jan Kiszka <jan.kiszka@siemens.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 3/9] usb: dwc3-generic: Reorder include
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



On 1/16/25 11:12, Mattijs Korpershoek wrote:
> Hi Patrice,
> 
> Thank you for the patch.
> 
> On jeu., janv. 16, 2025 at 09:17, Patrice Chotard <patrice.chotard@foss.st.com> wrote:
> 
>> Reorder include following rules available here :
>> https://docs.u-boot.org/en/latest/develop/codingstyle.html#include-files
> 
> Nitpick: we don't state in the commit message that we also removed the
> unused includes.
> A sentence like: "While at it, also remove the unused includes" would be
> nice to have.
> 
> If you need to send v3 for other reasons than this comment, please
> consider adding it.

Yes, i will update the comment
Thanks

Patrice

> 
> In case, this is a nitpick, so:
> 
> Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
> 
>>
>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>> Cc: Marek Vasut <marex@denx.de>
>>
>> ---
>>
>> Changes in v2:
>>   - remove useless include files
>>
>>  drivers/usb/dwc3/dwc3-generic.c | 20 ++++----------------
>>  1 file changed, 4 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/usb/dwc3/dwc3-generic.c b/drivers/usb/dwc3/dwc3-generic.c
>> index 2ab41cbae45..bc7d2d4234b 100644
>> --- a/drivers/usb/dwc3/dwc3-generic.c
>> +++ b/drivers/usb/dwc3/dwc3-generic.c
>> @@ -7,29 +7,17 @@
>>   * Based on dwc3-omap.c.
>>   */
>>  
>> -#include <cpu_func.h>
>> -#include <log.h>
>>  #include <dm.h>
>> -#include <dm/device-internal.h>
>> +#include <reset.h>
>> +#include <asm/gpio.h>
>>  #include <dm/lists.h>
>> -#include <dwc3-uboot.h>
>> -#include <generic-phy.h>
>> -#include <linux/bitops.h>
>>  #include <linux/delay.h>
>> -#include <linux/printk.h>
>> -#include <linux/usb/ch9.h>
>>  #include <linux/usb/gadget.h>
>> -#include <malloc.h>
>>  #include <power/regulator.h>
>> -#include <usb.h>
>> -#include "core.h"
>> -#include "gadget.h"
>> -#include <reset.h>
>> -#include <clk.h>
>>  #include <usb/xhci.h>
>> -#include <asm/gpio.h>
>> -
>> +#include "core.h"
>>  #include "dwc3-generic.h"
>> +#include "gadget.h"
>>  
>>  struct dwc3_generic_plat {
>>  	fdt_addr_t base;
>> -- 
>> 2.25.1
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
