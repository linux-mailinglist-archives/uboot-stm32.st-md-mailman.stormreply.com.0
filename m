Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C03A3AC573
	for <lists+uboot-stm32@lfdr.de>; Fri, 18 Jun 2021 09:55:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 243B1C58D7A;
	Fri, 18 Jun 2021 07:55:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76F78C3FADC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Jun 2021 07:55:25 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15I7rLcC006616; Fri, 18 Jun 2021 09:55:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : from : to
 : cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Fiw/XIsRAh24IyXiF9yZGdeTS4IYhtz3Rvy+SIS+++4=;
 b=ahvmmyLHKI9ghAQyTO8J/SS39w5Ci02JR2zhZmbQiHJIVc+MwAhweOnQv+25kSJzj6gt
 Qx8D6JhQSyATT1E7lSY56skd6zT33VosAE7w43BAaLUvuXzV8fBRxvd4fmtsC024Phmp
 aUcbx4oaSDw5tdjrOupmhY/r/E/PQeJONW5lXfFJ86+Cj76Cx80Uwqj1gtncB9pL/1ph
 A/5/FMXkl/6nz8s65qYUUGqKCiDdZdacvbYOo9rGGeZSJZ8ETVz8d9Q5LjBRXiR7V5bq
 g0ePl+fnd935m5YR11D6LrIyEigWLhN2c5kNhrPp7fi5qZ5Bxs6cmxyO3KzIK9B2ERA8 DA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3985b756hx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Jun 2021 09:55:24 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D632F10002A;
 Fri, 18 Jun 2021 09:55:23 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CB34D2199B3;
 Fri, 18 Jun 2021 09:55:23 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 18 Jun
 2021 09:55:23 +0200
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210427105751.1.I8857039ef25da53d584827b3056e461a9f7b323a@changeid>
 <6fb1073e-07ff-79ea-401d-66fdc6471dd7@foss.st.com>
Message-ID: <46b74879-9830-5bb8-ca8d-7c66bd68ce42@foss.st.com>
Date: Fri, 18 Jun 2021 09:55:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <6fb1073e-07ff-79ea-401d-66fdc6471dd7@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-17_17:2021-06-15,
 2021-06-17 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>
Subject: Re: [Uboot-stm32] [PATCH] clk: cosmetic change in uclass
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

On 6/18/21 8:41 AM, Patrice CHOTARD wrote:
> Hi Patrick
> 
> On 4/27/21 10:57 AM, Patrick Delaunay wrote:
>> Remove the tab in clk_get_bulk to respect the coding rules.
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> ---
>>
>>  drivers/clk/clk-uclass.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/clk-uclass.c b/drivers/clk/clk-uclass.c
>> index 4ab3c402ed..b126c5ed60 100644
>> --- a/drivers/clk/clk-uclass.c
>> +++ b/drivers/clk/clk-uclass.c
>> @@ -159,7 +159,7 @@ int clk_get_by_index_nodev(ofnode node, int index, struct clk *clk)
>>  int clk_get_bulk(struct udevice *dev, struct clk_bulk *bulk)
>>  {
>>  	int i, ret, err, count;
>> -	
>> +
>>  	bulk->count = 0;
>>  
>>  	count = dev_count_phandle_with_args(dev, "clocks", "#clock-cells", 0);
>>
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Thanks
> Patrice
> _______________________________________________
> Uboot-stm32 mailing list
> Uboot-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
> 

Applied on u-boot-stm32/next

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
