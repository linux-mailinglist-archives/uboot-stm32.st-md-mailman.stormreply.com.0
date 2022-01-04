Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 770D4483D06
	for <lists+uboot-stm32@lfdr.de>; Tue,  4 Jan 2022 08:38:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2EDD0C5F1F5;
	Tue,  4 Jan 2022 07:38:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1E028C5F1F1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Jan 2022 07:38:49 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2041FAlG016856;
 Tue, 4 Jan 2022 08:38:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Rul0PXHY7eAQrrPth8/MfZGfDM6KfquPfsED2CObc1c=;
 b=OAxWTn0BxOGmBztZPc1My45ROt1RrYzePpW3Z/T3yFFKI6MxecpdXNJexQXQtOHNpReR
 742ywUBBXmxrIFVXJSPInUbEMcccho1P66mMZBYWlq80Zmk7TeRg2+/Ze5sMvvCZVFKz
 FFwSsC6LQ5IMelkEQ6yPah66FJ0XWPUzAxFseHwqX5QM6702fLJqB74hJaWWld4HvQwF
 t42vA8gayHDFL2fkSbrcegk2ZB1AUZ/KghMWfRU1ybsHBZbKMte4K7tDn/jKcCR7h9IJ
 c51/UDMUWwyFD+qrbijXU/st9yiF8n/p8ouDEAKK/naBJYO61W0PDjaM8h6TR4oQQkp9 hg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dccdns4wq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 08:38:47 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9349510002A;
 Tue,  4 Jan 2022 08:38:46 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8B73D2224BC;
 Tue,  4 Jan 2022 08:38:46 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.47) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 4 Jan
 2022 08:38:45 +0100
To: Simon Glass <sjg@chromium.org>
References: <20211223160932.4311-1-patrice.chotard@foss.st.com>
 <CAPnjgZ2OXYP4cM8aDq4tELguZKohjwhYmgZ6ogEp0LgezyowkA@mail.gmail.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <720609f9-5bbd-8e50-422d-c51b4cb0e00f@foss.st.com>
Date: Tue, 4 Jan 2022 08:38:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAPnjgZ2OXYP4cM8aDq4tELguZKohjwhYmgZ6ogEp0LgezyowkA@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-04_03,2022-01-01_01,2021-12-02_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] dm: Fix OF_BAD_ADDR definition
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

Hi Simon

On 12/24/21 2:17 PM, Simon Glass wrote:
> Hi Patrice,
> 
> On Thu, 23 Dec 2021 at 09:09, Patrice Chotard
> <patrice.chotard@foss.st.com> wrote:
>>
>> When OF_LIVE flag is enabled on a 64 bits platform, there is an
>> issue when dev_read_addr() is called and need to perform an address
>> translation using __of_translate_address().
>>
>> In case of error, __of_translate_address() return value is OF_BAD_ADDR
>> (wich is defined in include/dm/of.h to ((u64)-1) = 0xffffffffffffffff).
>> The return value of dev_read_addr() is often compared to FDT_ADDR_T_NONE
>> which is defined as (-1U) = 0xffffffff.
>> In this case the comparison is always false.
>>
>> To fix this issue, define OF_BAD_ADDR to FDT_ADDR_T_NONE.
>>
>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>> ---
>>
>>  include/dm/of.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Would it be better to define FDT_ADDR_T_NONE as something like ((ulong)(-1)) ?

Agree, a v2 will be sent soon.

Thanks
Patrice

>>
>> diff --git a/include/dm/of.h b/include/dm/of.h
>> index 5cb6f44a6c..0208cc234a 100644
>> --- a/include/dm/of.h
>> +++ b/include/dm/of.h
>> @@ -95,7 +95,7 @@ static inline bool of_live_active(void)
>>         return gd_of_root() != NULL;
>>  }
>>
>> -#define OF_BAD_ADDR    ((u64)-1)
>> +#define OF_BAD_ADDR    FDT_ADDR_T_NONE
>>
>>  static inline const char *of_node_full_name(const struct device_node *np)
>>  {
>> --
>> 2.17.1
>>
> 
> Regards,
> Simon
> 
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
