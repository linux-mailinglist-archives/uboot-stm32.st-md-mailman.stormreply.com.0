Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3D6649CF6
	for <lists+uboot-stm32@lfdr.de>; Mon, 12 Dec 2022 11:48:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 812C8C65E62;
	Mon, 12 Dec 2022 10:48:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1595CC65E60
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Dec 2022 10:48:18 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BCAaxkL022306; Mon, 12 Dec 2022 11:48:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=UsOSqYAarOC3+oxSMqVgXTOVthccNwkg1rK+lm/AI3o=;
 b=g2jkkCNIsbF5wkZIpCwAZ9jpA5h2yCPf1sFvIXXL6tRhbDBGO2UoJ8SOSbR7LjAXIzel
 zQLMRJvnCnTbmqciwcju9ytcMBwd7rHKXDJHQSHgqBL1g7kPO+IiE97LVeLscyh8rTxu
 54h+Ggwb7YKrhlu7JjM0ToN0s6Hst4/QAHdZQqj3MPrysMQHm8FM0nZEfB7iZaqUTeAa
 TqqWatOoGFn9zMj29lVXZ5cxvEUUUT6H8+EeA/8TJpU1PJg+LyA5K2y/walrIJa2Uh74
 ypmulyfiNT1i/T7gPtbhJk3BlVTq/UDxhUjO5V0RhK2c6Wgk4CcRGb3eiwFzJ1X8JBre zg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3mcjb5a50r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 11:48:13 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 20C17100038;
 Mon, 12 Dec 2022 11:48:09 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 196EC21A22C;
 Mon, 12 Dec 2022 11:48:09 +0100 (CET)
Received: from [10.201.20.130] (10.201.20.130) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Mon, 12 Dec
 2022 11:48:08 +0100
Message-ID: <41b45896-86d9-f38f-d5d4-902144c01c05@foss.st.com>
Date: Mon, 12 Dec 2022 11:48:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Simon Glass <sjg@chromium.org>, Patrick Delaunay
 <patrick.delaunay@foss.st.com>
References: <20221026150508.1.I1b5ffc3bca09502549c075039f405dceb1646084@changeid>
 <CAPnjgZ1mJid6+9M0yumPdE79f7b2cAOKx1oZ7tnxkMM6y-aJkw@mail.gmail.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <CAPnjgZ1mJid6+9M0yumPdE79f7b2cAOKx1oZ7tnxkMM6y-aJkw@mail.gmail.com>
X-Originating-IP: [10.201.20.130]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-12_02,2022-12-12_01,2022-06-22_01
Cc: Jaehoon Chung <jh80.chung@samsung.com>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] dm: pmic: ignore disabled node in
 pmic_bind_children
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

On 10/27/22 17:22, Simon Glass wrote:
> On Wed, 26 Oct 2022 at 07:05, Patrick Delaunay
> <patrick.delaunay@foss.st.com> wrote:
>>
>> Ignore the disabled children node in pmic_bind_children() so the
>> disabled regulators in device tree are not registered.
>>
>> This patch is based on the dm_scan_fdt_node() code - only the
>> activated nodes are bound -  and it solves possible issue when a
>> deactivated regulator is bound, error for duplicated regulator name
>> for example.
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> ---
>> This patch solves the errors for duplicated regulator names on STM32MP15x
>> boards since the alignment with Linux device tree with the commit
>> 9157a4ce36b18 ("ARM: dts: stm32: update SCMI dedicated file").
>>
>> When SCMI is activated in "<board>-scmi.dts" device tree, the 3 regulators
>> reg11, reg18, usb33 are duplicated (children of scmi_reguls and of
>> pwr_regulators) even if the children of pwr_regulators are deactivated in
>> the file arch/arm/dts/stm32mp15-scmi.dtsi.
>>
>>  drivers/power/pmic/pmic-uclass.c | 4 ++++
>>  1 file changed, 4 insertions(+)
> 
> Reviewed-by: Simon Glass <sjg@chromium.org>
> _______________________________________________
> Uboot-stm32 mailing list
> Uboot-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Applied to u-boot-stm/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
