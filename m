Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 80722338D22
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Mar 2021 13:33:01 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44657C57B55;
	Fri, 12 Mar 2021 12:33:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83085C57B53
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Mar 2021 12:33:00 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12CCNF7A029657; Fri, 12 Mar 2021 13:32:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : from : to
 : cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=+zsc3JNmMvs55HVv7TuQb5hWjKVzYOFVt8qBQWM7n/0=;
 b=5PkWZx9FX5ZyLglDtKY2Q7+X5+Mj1r+AScmNAq2pBo84ICqbE9kShD6hCVu/3n47qjgl
 FLr9N8oslqWdC+KtS4TlfC8CR/0v26W5n4Y7yuu0YGWgiIyOhCzDKWBVaTAb9fbpVASW
 QQKDqJyh3GiH1GXy5zoMpx7Mk6FUL6MNqJPtApRPzPTb694CN108lxhb997eAVNYQyiJ
 fTyIT4HC9eYERRngPHLsinaEFHq13VK0YVytlp78bVAGRaMUJ1Ecm3B3pX+CSyA/Fmqb
 aaylgtRpz43WY+xvA4hqcs1Zgpbjn0Nc3aDRrEPwIuykxfW3XxMzNYXDjJecwTRqF3DM UQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 373yrf5tyc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Mar 2021 13:32:59 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8C36210002A;
 Fri, 12 Mar 2021 13:32:58 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 819B623DCD0;
 Fri, 12 Mar 2021 13:32:58 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.45) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 12 Mar
 2021 13:32:57 +0100
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210304131031.1.I7936291936df6580c70e36c7d96ed2a7c82bc577@changeid>
 <de6fa919-bae8-5c3d-5fb6-729157e90c37@foss.st.com>
Message-ID: <c1d39b80-8974-94b0-00b6-080e12117a50@foss.st.com>
Date: Fri, 12 Mar 2021 13:32:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <de6fa919-bae8-5c3d-5fb6-729157e90c37@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-12_03:2021-03-10,
 2021-03-12 signatures=0
Cc: Simon Glass <sjg@chromium.org>, Philippe Cornu <philippe.cornu@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Yannick Fertre <yannick.fertre@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: Re: [Uboot-stm32] [PATCH] video: stm32: remove all child of DSI
 bridge when its probe failed
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

Hi

On 3/9/21 3:21 PM, Patrice CHOTARD wrote:
> Hi Patrick
> 
> On 3/4/21 1:10 PM, Patrick Delaunay wrote:
>> From: Patrick Delaunay <patrick.delaunay@st.com>
>>
>> Remove the child device of the STM32 DSI bridge when the driver probe
>> failed to stop futher probe request on panels used with STMicroelectronics
>> board (orisetech_otm8009a.c or raydium-rm68200.c driver).
>>
>> This patch avoid the trace "cannot get reset GPIO" when
>> STM32MP157 device tree is used on stm32MP151 SOC without DSI support.
>>
>> In this hw_version value is 0, as DSI bridge is absent and the panel
>> ofdata_to_platdata is called for each try of panel probe,
>> the gpio reset pin is requested but after dsi father probe failed).
>>
>> For the next request, the PANEL ofdata_to_platdata failed as the gpio
>> is already used.
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> ---
>>
>>  drivers/video/stm32/stm32_dsi.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/video/stm32/stm32_dsi.c b/drivers/video/stm32/stm32_dsi.c
>> index 8891ca4b78..4027e978c8 100644
>> --- a/drivers/video/stm32/stm32_dsi.c
>> +++ b/drivers/video/stm32/stm32_dsi.c
>> @@ -483,6 +483,9 @@ static int stm32_dsi_probe(struct udevice *dev)
>>  	if (priv->hw_version != HWVER_130 &&
>>  	    priv->hw_version != HWVER_131) {
>>  		dev_err(dev, "DSI version 0x%x not supported\n", priv->hw_version);
>> +		dev_dbg(dev, "remove and unbind all DSI child\n");
>> +		device_chld_remove(dev, NULL, DM_REMOVE_NORMAL);
>> +		device_chld_unbind(dev, NULL);
>>  		ret = -ENODEV;
>>  		goto err_clk;
>>  	}
>>
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Thanks
> Patrice
> 
Applied to u-boot-stm/next

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
