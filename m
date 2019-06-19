Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B32F4BC32
	for <lists+uboot-stm32@lfdr.de>; Wed, 19 Jun 2019 17:01:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3AE8AC57188
	for <lists+uboot-stm32@lfdr.de>; Wed, 19 Jun 2019 15:01:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4BEC1C57187
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2019 15:01:37 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5JEvII1013057; Wed, 19 Jun 2019 17:01:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=ZIMWzQAqdP6YlBGuOasrkoz+MKXaNtxolhsfGG5iEOw=;
 b=m1ODiahZyu1Kmm55Sd+pLZ9b1yNQCWZRd0J0T0JNtsec9Ytsi0K9q/A3H/ZQuC5XmjkG
 A9+SufQDrAD/9epcBv9vCxhkW3mUmVpWGuuTudHqjEW3VmCJBqBSwi/2SqTp66c9WREZ
 aIm08HvLKJS4Eagk9hT49inmil+ujHtg0NvdeXvpyqnZXuks2bzH6dnjDIeW+eznqIbJ
 FiueITICJG2qPNK2trxgtXWboByQE+0yxDY9PI5/BNczcA9QmWeeVQx+anrRkVtndz01
 nA0Ko81YYawFyHeocXp81NmzvJT4osvRi33QWJtyOYcLckwUXYstWdwAwwrgDbsHbeZ3 pA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t7813cj6n-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 19 Jun 2019 17:01:33 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5493C34;
 Wed, 19 Jun 2019 15:01:32 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 33EB62AE0;
 Wed, 19 Jun 2019 15:01:32 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 19 Jun
 2019 17:01:31 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 19 Jun 2019 17:01:31 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Marek Vasut <marex@denx.de>, Patrick DELAUNAY <patrick.delaunay@st.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [U-Boot] [PATCH v2 1/3] usb: dwc2: correctly handle binding for
 g-tx-fifo-size
Thread-Index: AQHVJfVycfC26mKgo02Di9YHe9wP36ai8k+A
Date: Wed, 19 Jun 2019 15:01:31 +0000
Message-ID: <9403bfa7-fae3-3450-2888-fd9073c100b2@st.com>
References: <1560869838-22025-1-git-send-email-patrick.delaunay@st.com>
 <19c2894d-a526-da83-3f93-20de1605cbaa@denx.de>
In-Reply-To: <19c2894d-a526-da83-3f93-20de1605cbaa@denx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <DEABDA231BDD8447A23B7D41C99A54A9@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-19_09:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH v2 1/3] usb: dwc2: correctly
 handle binding for g-tx-fifo-size
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
>> Manage g-tx-fifo-size as a array as specify in the binding.
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Marek Vasut <marex@denx.de>
>
> I'm missing 2/3 , although I think it might be better if you take this
> whole series through u-boot-stm .

Applied to uboot-stm

Thanks


>> ---
>>
>> Changes in v2:
>> - move dt update in a separate patch
>> - remove unecessary temporary variable
>>
>>  drivers/usb/gadget/dwc2_udc_otg.c | 14 +++++++++++++-
>>  1 file changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/gadget/dwc2_udc_otg.c b/drivers/usb/gadget/dwc2_udc_otg.c
>> index 494ab53..023439c 100644
>> --- a/drivers/usb/gadget/dwc2_udc_otg.c
>> +++ b/drivers/usb/gadget/dwc2_udc_otg.c
>> @@ -1039,6 +1039,7 @@ static int dwc2_udc_otg_ofdata_to_platdata(struct udevice *dev)
>>  	int node = dev_of_offset(dev);
>>  	ulong drvdata;
>>  	void (*set_params)(struct dwc2_plat_otg_data *data);
>> +	int ret;
>>  
>>  	if (usb_get_dr_mode(node) != USB_DR_MODE_PERIPHERAL) {
>>  		dev_dbg(dev, "Invalid mode\n");
>> @@ -1050,7 +1051,18 @@ static int dwc2_udc_otg_ofdata_to_platdata(struct udevice *dev)
>>  	platdata->rx_fifo_sz = dev_read_u32_default(dev, "g-rx-fifo-size", 0);
>>  	platdata->np_tx_fifo_sz = dev_read_u32_default(dev,
>>  						       "g-np-tx-fifo-size", 0);
>> -	platdata->tx_fifo_sz = dev_read_u32_default(dev, "g-tx-fifo-size", 0);
>> +
>> +	platdata->tx_fifo_sz_nb =
>> +		dev_read_size(dev, "g-tx-fifo-size") / sizeof(u32);
>> +	if (platdata->tx_fifo_sz_nb > DWC2_MAX_HW_ENDPOINTS)
>> +		platdata->tx_fifo_sz_nb = DWC2_MAX_HW_ENDPOINTS;
>> +	if (platdata->tx_fifo_sz_nb) {
>> +		ret = dev_read_u32_array(dev, "g-tx-fifo-size",
>> +					 platdata->tx_fifo_sz_array,
>> +					 platdata->tx_fifo_sz_nb);
>> +		if (ret)
>> +			return ret;
>> +	}
>>  
>>  	platdata->force_b_session_valid =
>>  		dev_read_bool(dev, "u-boot,force-b-session-valid");
>>
>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
