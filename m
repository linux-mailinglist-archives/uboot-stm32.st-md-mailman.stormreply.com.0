Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9188BD6682
	for <lists+uboot-stm32@lfdr.de>; Mon, 14 Oct 2019 17:50:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5DA67C36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 14 Oct 2019 15:50:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D5CDC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Oct 2019 15:50:58 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9EFk1oG020574; Mon, 14 Oct 2019 17:50:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=N9Y6JSJCq28lnV6GLc2mMhdHn+eSkRbQP71Lw+jgkoA=;
 b=CHH2lY79OptgQdTt2ft3G0fc2O2e59YVSOM9ZUvPOWO1cySSOps4ujdSv+q2fwnMCHAJ
 U1xYGOZwUldPX0F79gM4H0uWDSTYn3/KMtncx2VkU45BmM/I2/RB0QSYXZMZxmK6iZKc
 oMyohlPDBaFy2mCQ5Z9s06QRGl1Z0LPAPI7i3QaV21ePrkRaHcg9YonDlHn6wRgxGa8o
 hXJd0uFjEw/NUaVS/TqpcHKOZfYDKMOEWlWWDsSx9FLBglkVuGTLi9mUeQK/e5aUqFI/
 6/aS9R+EIk/raaWgbmYFUN0VAn2Yx24JeOZ1c777QDRlcgEl/OFjsoyn1QTYU6k+UF1U ug== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vk4kwu65a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Oct 2019 17:50:57 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D2D2E10002A;
 Mon, 14 Oct 2019 17:50:56 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C561B2CDC2B;
 Mon, 14 Oct 2019 17:50:56 +0200 (CEST)
Received: from SFHDAG5NODE3.st.com (10.75.127.15) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 14 Oct
 2019 17:50:56 +0200
Received: from SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47]) by
 SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47%20]) with mapi id
 15.00.1473.003; Mon, 14 Oct 2019 17:50:56 +0200
From: Fabien DESSENNE <fabien.dessenne@st.com>
To: Suman Anna <s-anna@ti.com>, Simon Glass <sjg@chromium.org>, "Patrick
 DELAUNAY" <patrick.delaunay@st.com>, Christophe KERELLO
 <christophe.kerello@st.com>, Patrice CHOTARD <patrice.chotard@st.com>,
 "Vutla, Lokesh" <lokeshvutla@ti.com>
Thread-Topic: [U-Boot] [PATCH 5/5] remoteproc: stm32: invert the is_running()
 return value
Thread-Index: AQHVfrdcqItUAq6YgU+rYzRbXgwkU6dVvfcAgARxZQA=
Date: Mon, 14 Oct 2019 15:50:56 +0000
Message-ID: <093fc513-6098-5a86-7c8d-30575687f86d@st.com>
References: <1570635389-8445-1-git-send-email-fabien.dessenne@st.com>
 <1570635389-8445-6-git-send-email-fabien.dessenne@st.com>
 <510f06c7-11e6-0a62-9ed4-f17736c4b9ac@ti.com>
In-Reply-To: <510f06c7-11e6-0a62-9ed4-f17736c4b9ac@ti.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
Content-ID: <93E491B265D02241B262ACF2CF92ABF4@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-14_08:2019-10-11,2019-10-14 signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH 5/5] remoteproc: stm32: invert
 the is_running() return value
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


On 11/10/2019 10:00 PM, Suman Anna wrote:
> On 10/9/19 10:36 AM, Fabien Dessenne wrote:
>> The .is_running() ops expects a return value of 0 if the processor is
>> running, 1 if not running : align to this.
>>
>> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> This patch should be earlier than patch4, right?


You're probably right. I will double check this in v2.


>
> Reviewed-by: Suman Anna <s-anna@ti.com>
>
>> ---
>>   drivers/remoteproc/stm32_copro.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/remoteproc/stm32_copro.c b/drivers/remoteproc/stm32_copro.c
>> index eef3416..fce9653 100644
>> --- a/drivers/remoteproc/stm32_copro.c
>> +++ b/drivers/remoteproc/stm32_copro.c
>> @@ -237,14 +237,14 @@ static int stm32_copro_stop(struct udevice *dev)
>>   /**
>>    * stm32_copro_is_running() - Is the STM32 remote processor running
>>    * @dev:	corresponding STM32 remote processor device
>> - * @return 1 if the remote processor is running, 0 otherwise
>> + * @return 0 if the remote processor is running, 1 otherwise
>>    */
>>   static int stm32_copro_is_running(struct udevice *dev)
>>   {
>>   	struct stm32_copro_privdata *priv;
>>   
>>   	priv = dev_get_priv(dev);
>> -	return priv->is_running;
>> +	return !priv->is_running;
>>   }
>>   
>>   static const struct dm_rproc_ops stm32_copro_ops = {
>>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
