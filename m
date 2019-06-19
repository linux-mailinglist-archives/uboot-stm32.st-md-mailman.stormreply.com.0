Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DC64BC37
	for <lists+uboot-stm32@lfdr.de>; Wed, 19 Jun 2019 17:02:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57BA8C5718B
	for <lists+uboot-stm32@lfdr.de>; Wed, 19 Jun 2019 15:02:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF4A7C5718A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2019 15:02:17 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5JF1cAO024424; Wed, 19 Jun 2019 17:02:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=UywXq7t89I4xiasIBBfc5XylsczVylwODXuumU6t5ZM=;
 b=CnBuEJrpBh8wzkr9d0cZTOBqJUHCng/dLQ2SMHYc8bah2txfFwpwZ4U5Jcyvx/vIqpCh
 33qo6pQAEfaIVC5p8VXrDV1tnbepq4YLz8fzjZHThSu0xKJBbkoM+FTdw2029bilWKGF
 kxSCbr7pV5iikCoKDdaEGl3oTfj+JJTPD7zIeahfZl1JRxhBl1csRoxXREXqjosI+wt9
 0UK6AP0sq0AOgmgDxWw+lN9oHZDkYXvMtfe6HSDluP3Kpnd4ay0ZtDdiZyl43//aPdpw
 /I3u22Y21oMmJfMfpPaAyCag90WEEWm0PHVMMb6ROPtTPChTZQwOUmRkLBP5k8FH6ZlO Og== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t781a4hyq-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 19 Jun 2019 17:02:16 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9954F3A;
 Wed, 19 Jun 2019 15:02:15 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 547BD2AE6;
 Wed, 19 Jun 2019 15:02:15 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 19 Jun
 2019 17:02:14 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 19 Jun 2019 17:02:14 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Marek Vasut <marex@denx.de>, Patrick DELAUNAY <patrick.delaunay@st.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [U-Boot] [PATCH v2 3/3] usb: dwc2: allow peripheral mode for OTG
 configuration
Thread-Index: AQHVJfWDMJylLB3AIk2X2Fhjmu3ASqai8oIA
Date: Wed, 19 Jun 2019 15:02:14 +0000
Message-ID: <c01c9e64-ec99-572d-a048-33d53eea0e4a@st.com>
References: <1560869838-22025-1-git-send-email-patrick.delaunay@st.com>
 <1560869838-22025-3-git-send-email-patrick.delaunay@st.com>
 <fdbe01c7-dc25-df9c-5f8f-a02b2f89cc47@denx.de>
In-Reply-To: <fdbe01c7-dc25-df9c-5f8f-a02b2f89cc47@denx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <5A7083B388621745BE79F065B945073B@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-19_09:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH v2 3/3] usb: dwc2: allow
 peripheral mode for OTG configuration
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

Hi Patrick

On 6/18/19 6:46 PM, Marek Vasut wrote:
> On 6/18/19 4:57 PM, Patrick Delaunay wrote:
>> Allow device mode in DWC2 driver when device tree select the dr_mode
>> "peripheral" or "otg".
>>
>> The device mode is not allowed when dr_mode = "host" in device tree.
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Marek Vasut <marex@denx.de>
>
>> ---
>>
>> Changes in v2: None
>>
>>  drivers/usb/gadget/dwc2_udc_otg.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/gadget/dwc2_udc_otg.c b/drivers/usb/gadget/dwc2_udc_otg.c
>> index 023439c..35f4147 100644
>> --- a/drivers/usb/gadget/dwc2_udc_otg.c
>> +++ b/drivers/usb/gadget/dwc2_udc_otg.c
>> @@ -1041,7 +1041,8 @@ static int dwc2_udc_otg_ofdata_to_platdata(struct udevice *dev)
>>  	void (*set_params)(struct dwc2_plat_otg_data *data);
>>  	int ret;
>>  
>> -	if (usb_get_dr_mode(node) != USB_DR_MODE_PERIPHERAL) {
>> +	if (usb_get_dr_mode(node) != USB_DR_MODE_PERIPHERAL &&
>> +	    usb_get_dr_mode(node) != USB_DR_MODE_OTG) {
>>  		dev_dbg(dev, "Invalid mode\n");
>>  		return -ENODEV;
>>  	}
>>
>

Applied to uboot-stm

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
