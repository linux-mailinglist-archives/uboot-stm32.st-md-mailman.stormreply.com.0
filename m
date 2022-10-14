Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 781E25FEE69
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Oct 2022 15:11:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C04BC6411E;
	Fri, 14 Oct 2022 13:11:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 666EAC640FF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Oct 2022 13:11:43 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29EB0nOc023247;
 Fri, 14 Oct 2022 15:11:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=eTvoCGGWVvaHFDElbpfEXlercpsQIki0wEp4l0cLaYk=;
 b=VDBnVTiXJj7zYPA6aTrYAbB2Agy4d8Nt93twsCB4A+WiIkaf+byQEnuLgxovOAyQMXNr
 JBkjY85QKD7P9Di1sZY0iA/rSjOSwUtETDCNvI5UrqIuPY3r763lAT3j3udcTi3Lm3LF
 4sIVxbxV0wH9K1S5I1IHRlbk6oQrUwOTK4dyT7Wt18IOg5+eInBdUsdrPwZYEC2V+TJS
 eKNPGhg1U2QlZz6q7K1von1z5OIBPcQV5+W7JQwk8M9o06geqH4EvXN4rPHdqiGsyYPT
 JK8j9Y0ZQQgaul85fFLs+0wC2JgZZF+2ZtF1/Qs8xViQa5lsu/0MuoiZYjSu3VZCmiDW gA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3k64m7wkdw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Oct 2022 15:11:42 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1AB0C10002A;
 Fri, 14 Oct 2022 15:11:38 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1658822AFF8;
 Fri, 14 Oct 2022 15:11:38 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.121) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Fri, 14 Oct
 2022 15:11:37 +0200
Message-ID: <c7c128f9-7c28-f958-e4fe-ca63ee69ed3f@foss.st.com>
Date: Fri, 14 Oct 2022 15:11:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Patrice CHOTARD <patrice.chotard@foss.st.com>, Pralay Panchwate
 <pralay@melodyinnovations.com>
References: <CACBcyETUAQHgXB7XKho4n44enk-uaPBotqfCAyQx8-qcAivOZQ@mail.gmail.com>
 <4fadf61f-7526-e30f-9dfb-723727da2862@foss.st.com>
 <CACBcyERwh44TbW-WKFTLfrdvAeUYqYoJo97OyqxgdM3VtSVdow@mail.gmail.com>
 <f1283e48-8b5f-2eae-6e97-acdd3fe85d48@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <f1283e48-8b5f-2eae-6e97-acdd3fe85d48@foss.st.com>
X-Originating-IP: [10.75.127.121]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-14_07,2022-10-14_01,2022-06-22_01
Cc: uboot-stm32@st-md-mailman.stormreply.com, bernard.puel@st.com
Subject: Re: [Uboot-stm32] Issues with Loading Linux OS on our custom made
 STM32 SOM board
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

+ Bernard

On 10/14/22 14:51, Patrice CHOTARD wrote:
> Hi
>
> When did you submit your request on ST forum ?
> Can you send the link of your forum request ?
> I can't find it.
>
> Thanks
>
> On 10/14/22 14:42, Pralay Panchwate wrote:
>> Hi Patrice,
>> I have already submitted this post with the same title on the forum but, No
>> reply from anyone whatsoever.
>> Any support form you guys will be highly appreciated.
>>
>> Regards,
>> Pralay Panchwate
>> Embedded Engineer
>> Melody innovations pvt ltd.
>> Contact: +91-9850211623
>>
>> The information transmitted by this email is intended only for the person
>> or entity to which it is addressed. This email may contain proprietary,
>> business-confidential, and/or privileged material. If you are not the
>> intended recipient of this message, be aware that any use, review,
>> re-transmission, distribution, reproduction or any action taken in reliance
>> upon this message is strictly prohibited. If you received this in error,
>> please contact the sender and delete the material from all computers.
>>
>>
>> On Fri, 14 Oct 2022 at 14:19, Patrice CHOTARD <patrice.chotard@foss.st.com>
>> wrote:
>>
>>> Hi Pralay
>>>
>>> Submit either your request on online support :
>>> https://community.st.com/s/onlinesupport
>>> or
>>> Post a message on STM32MPUs forum:
>>> https://community.st.com/s/topic/0TO0X0000003u2AWAQ/stm32-mpus
>>>
>>> Thanks
>>> Patrice
>>>
>>> On 10/13/22 11:04, Pralay Panchwate wrote:
>>>> Hello Everyone,
>>>> We are in the development phase of our own custom made SOM board using
>>>> STM32MP157A chip.
>>>> Can we use STM32MP157A-EV1 image for flashing our custom STM32MP1 based
>>>> board ?
>>>>
>>>> We tried burning our STM32MP1 board with existing "
>>>> *FlashLayout_emmc_stm32mp157a-ev1-trusted.tsv*" file but it throws
>>>> following error -
>>>>
>>>>   Error: TSV files are only supported for STM32MP
>>>>
>>>> We're using an onboard eMMC (From Kioxia) and STM32MP157AAD3 chip from
>>> ST.
>>>> I have attached snapshot of log. and I'm extremely in need of support
>>>> Below is the LOG:
>>>>
>>>>
>>>>     1. user@user:~/STM32MPU-Ecosystem-v4.0.0/Starter-Package/stm32mp1-
>>>>     openstlinux-5.15-yocto-kirkstone-mp1-v22.06.15/images/stm32mp1$
>>>>     STM32_Programmer_CLI -c port=usb1 -w
>>> flashlayout_st-image-weston/trusted/
>>>>     FlashLayout_emmc_stm32mp157a-ev1-trusted.tsv
>>>>     2. -------------------------------------------------------------------
>>>>     3. STM32CubeProgrammer v2.11.0
>>>>     4. -------------------------------------------------------------------
>>>>     5.
>>>>     6.
>>>>     7.
>>>>     8. USB speed : High Speed (480MBit/s)
>>>>     9. Manuf. ID : STMicroelectronics
>>>>     10. Product ID : DFU in HS Mode @Device ID /0x500, @Revision ID
>>> /0x0000
>>>>     11. SN : 0019002C3431511733353431
>>>>     12. DFU protocol: 1.1
>>>>     13. Board : --
>>>>     14. Device ID : 0x0500
>>>>     15. Device name : STM32MP1
>>>>     16. Device type : MPU
>>>>     17. Revision ID : --
>>>>     18. Device CPU : Cortex-A7
>>>>     19.
>>>>     20. Start Embedded Flashing service
>>>>     21.
>>>>     22.
>>>>     23.
>>>>     24. Memory Programming ...
>>>>     25. Opening and parsing file: tf-a-stm32mp157a-ev1-usb.stm32
>>>>     26. File : tf-a-stm32mp157a-ev1-usb.stm32
>>>>     27. Size : 220.82 KB
>>>>     28. Partition ID : 0x01
>>>>     29.
>>>>     30. Download in Progress:
>>>>     31. [==================================================] 100%
>>>>     32.
>>>>     33. File download complete
>>>>     34. Time elapsed during download operation: 00:00:01.150
>>>>     35.
>>>>     36. RUNNING Program ...
>>>>     37. PartID: :0x01
>>>>     38.
>>>>     39.
>>>>     40. Error: Start operation failed at partition 0x01
>>>>     41. Error: TSV flashing service failed
>>>>     42. user@user:~/STM32MPU-Ecosystem-v4.0.0/Starter-Package/stm32mp1-
>>>>     openstlinux-5.15-yocto-kirkstone-mp1-v22.06.15/images/stm32mp1$
>>>>     STM32_Programmer_CLI -c port=usb1 -w
>>> flashlayout_st-image-weston/trusted/
>>>>     FlashLayout_emmc_stm32mp157a-ev1-trusted.tsv
>>>>     43.
>>> -------------------------------------------------------------------
>>>>     44. STM32CubeProgrammer v2.11.0
>>>>     45.
>>> -------------------------------------------------------------------
>>>>     46.
>>>>     47.
>>>>     48.
>>>>     49. USB speed : High Speed (480MBit/s)
>>>>     50. Manuf. ID :
>>>>     51. Product ID :
>>>>     52. SN :
>>>>     53. DFU protocol: 1.1
>>>>     54. Board : --
>>>>     55. IAP
>>>>     56. Error: TSV files are only supported for STM32MP
>>>>
>>>>
>>>> Please help us and revert on this problem ASAP.
>>>>
>>>> Regards,
>>>> Pralay Panchwate
>>>> Embedded Engineer
>>>> Melody innovations pvt ltd.
>>>> Contact: +91-9850211623
>>>>
>>>> The information transmitted by this email is intended only for the person
>>>> or entity to which it is addressed. This email may contain proprietary,
>>>> business-confidential, and/or privileged material. If you are not the
>>>> intended recipient of this message, be aware that any use, review,
>>>> re-transmission, distribution, reproduction or any action taken in
>>> reliance
>>>> upon this message is strictly prohibited. If you received this in error,
>>>> please contact the sender and delete the material from all computers.
>>>>
>>>>
>>>> _______________________________________________
>>>> Uboot-stm32 mailing list
>>>> Uboot-stm32@st-md-mailman.stormreply.com
>>>> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
>>> _______________________________________________
>>> Uboot-stm32 mailing list
>>> Uboot-stm32@st-md-mailman.stormreply.com
>>> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
>>>
> _______________________________________________
> Uboot-stm32 mailing list
> Uboot-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
