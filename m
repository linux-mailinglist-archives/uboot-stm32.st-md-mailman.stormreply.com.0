Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBE6118DB2
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 Dec 2019 17:36:50 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08DE1C36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 Dec 2019 16:36:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C8AFBC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Dec 2019 16:36:48 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBAGWNvW009880; Tue, 10 Dec 2019 17:36:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=quxERYDjKnMVENvgbQ7wBFp4AfHo/YufQJntJ4/JwAM=;
 b=vG0AOzO8vuECOhkpUupRieJcYapK1KhlcqDpSf7Cw68whCMCmWQsA7/DYXiwkIB9a30b
 TiJHgIVmpBcBfSbrpsRQs323OlBOumtcwc4DPMg9/mcIU1947b+h1hjses4PjQWPLOqU
 LbDxZn1S8ziodcfox31mgknIrEVCh92XfTvigvUzBTIAfEvX93KDYEAocb0eOpqfqu1r
 TEaqfnWsqBcDDozSgQ+U6OL6EBPPFfN3/n5eLWKcGrQ/bgh/3XV+O7EfsA1gkwR+6xd8
 HI1UzYMp+iqxROCFmu64lkA55FLFiU/aXkOnNXoq3UQDFopa1nl1BI0euDb+87/KeO07 ag== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2wrbrfdkdj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Dec 2019 17:36:46 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7A356100034;
 Tue, 10 Dec 2019 17:36:46 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6DF7D2BAB6C;
 Tue, 10 Dec 2019 17:36:46 +0100 (CET)
Received: from SFHDAG5NODE3.st.com (10.75.127.15) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 10 Dec
 2019 17:36:45 +0100
Received: from SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47]) by
 SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47%20]) with mapi id
 15.00.1473.003; Tue, 10 Dec 2019 17:36:45 +0100
From: Fabien DESSENNE <fabien.dessenne@st.com>
To: Simon Glass <sjg@chromium.org>
Thread-Topic: [PATCH 1/5] remoteproc: elf_loader: Add elf resource table load
 support
Thread-Index: AQHVfrdZXIgBjTwjO0e3NTujI/CKL6dltLeAgACc2oCADCjXAIAAhmkAgEDLEoCAABXvgA==
Date: Tue, 10 Dec 2019 16:36:45 +0000
Message-ID: <64b6f3f8-8f3c-a41d-70f9-87386f12946a@st.com>
References: <1570635389-8445-1-git-send-email-fabien.dessenne@st.com>
 <1570635389-8445-2-git-send-email-fabien.dessenne@st.com>
 <CAPnjgZ33+J-10WgcmFBjGuqJ90caJFj7mGy+vApbxAyymCXvZw@mail.gmail.com>
 <9a098f3c-250c-d589-70d3-6dcfe0fbdc93@st.com>
 <CAPnjgZ3mf-edo-_kWRqz4o4mh34rOzw76sxo6bPE6yJ3XuJEvQ@mail.gmail.com>
 <7843e136-32cf-bdf0-d27c-db85651c4f9d@st.com>
 <CAPnjgZ36zJWaqgbnEWUN4gK3DC5ppaK+YA3gMKmu+WmK8aK64g@mail.gmail.com>
In-Reply-To: <CAPnjgZ36zJWaqgbnEWUN4gK3DC5ppaK+YA3gMKmu+WmK8aK64g@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <27C88393264C824BBAB6DE641800E83E@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-10_04:2019-12-10,2019-12-10 signatures=0
Cc: Christophe KERELLO <christophe.kerello@st.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 1/5] remoteproc: elf_loader: Add elf
 resource table load support
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

Btw, I sent a v2 for this patch:

https://www.mail-archive.com/u-boot@lists.denx.de/msg346085.html


On 10/12/2019 4:18 PM, Simon Glass wrote:
> Hi Fabien,
>
> On Wed, 30 Oct 2019 at 03:50, Fabien DESSENNE <fabien.dessenne@st.com> wrote:
>> Hi Simon
>>
>> On 30/10/2019 2:49 AM, Simon Glass wrote:
>>> Hi Fabien,
>>>
>>> On Tue, 22 Oct 2019 at 03:08, Fabien DESSENNE <fabien.dessenne@st.com> wrote:
>>>> Hi Simon,
>>>>
>>>>
>>>> On 22/10/2019 1:47 AM, Simon Glass wrote:
>>>>> Hi Fabien,
>>>>>
>>>>> On Wed, 9 Oct 2019 at 09:36, Fabien Dessenne <fabien.dessenne@st.com> wrote:
>>>>>> Add rproc_elf_load_rsc_table(), which searches for a resource table in
>>>>>> an elf64/elf32 image, and if found, copies it to device memory.
>>>>>> Add also the elf32 and elf64 variants of this API.
>>>>>> Add a test for this.
>>>>>>
>>>>>> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
>>>>>> ---
>>>>>>     drivers/remoteproc/rproc-elf-loader.c | 269 ++++++++++++++++++++++++++++++++++
>>>>>>     include/remoteproc.h                  |  70 +++++++++
>>>>>>     test/dm/remoteproc.c                  |  91 ++++++++++--
>>>>>>     3 files changed, 419 insertions(+), 11 deletions(-)
>>>>>>
>>>>> If you are putting stuff in the image, should you use binman to build
>>>>> the image, then find the contents using the binman tables?
>>>> The "resource table" may be located anywhere, there is no strict rule
>>>> defining where it is expected to be.
>>>>
>>>> Nevertheless the Linux remoteproc[1] and OpenAmp (running RTOS) [2]
>>>> frameworks expect the resource table to be stored in a dedicated ELF
>>>> section. Both of them run some ELF scanning to find out this section.
>>>>
>>>> The proposed patch is for the "ELF section" variant of the resource table.
>>>> Other variants like binman packing may be proposed as well, both
>>>> implementations can coexist alongside.
>>> So why not use binman to pack the image and find the components? This
>>> is U-Boot, after all.
>>>
>> Packing the firmware together with the other U-Boot components is
>> acceptable if the firmware is controlled only by U-Boot.
>> My requirement is that the coprocessor firmware shall be loaded by
>> U-Boot or by Linux.
>>
>> You can have a look at [1] for more details on the way this is handled
>> on STM32 MPU. In that case, the .elf firmware is stored in a in File
>> System that can be read by both U-Boot and Linux.
>>
> Where is the coprocessor firmware stored, then?
>
>> If we have the firmware packed in the image (for U-Boot), we need to
>> have a copy in the FileSystem (for Linux) which would not be a good idea.
> What type of filesystem do you use? I don't see any filesystem access
> in this patch though.
>
>> BR
>> Fabien
>>
>> [1] https://wiki.st.com/stm32mpu/index.php/Boot_chains_overview
> Regards,
> Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
