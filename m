Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D083C6B2209
	for <lists+uboot-stm32@lfdr.de>; Thu,  9 Mar 2023 11:59:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97D01C6A609;
	Thu,  9 Mar 2023 10:59:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2DA04C6A5FD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Mar 2023 10:59:22 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3299fFZZ030999; Thu, 9 Mar 2023 11:59:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=j5LyyZiobHwZ2ned2qT7Ez5JcOEImOMYMbqhh6FeCeI=;
 b=bzzB5ROTuw+kjtWWCIyJSI7gj2nNwzkklIj+myDYMdfBFKt9sWDArtaOo5LD5lwqp0ap
 eZy4C2G96HrTBrOcnc05Ou6CTfyb/m9tZObmX4QPF/4BRuy0QE8UGXQ2qCc98FxrxZvl
 VbWKZKgmHGonAU/D1EJVUKiDuyWUORVGQgeoTaDBWYzTq1cONp8Wrn6vzL++o8wjWORP
 f+TloYld5OZPywi/i/Z6I/lNl+H1JarhppZQD+LMaigtpuwKU68cTacZl9IkiC3LpcCD
 iEprs6p2hjerhshjgSm/RZ7uYzfsQ2HhCUhFcHE9NSfMiz4BeU1D9EvyT5dT9JF904kN YA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3p6fdru8cj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Mar 2023 11:59:20 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1DBC910002A;
 Thu,  9 Mar 2023 11:59:20 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1893120FA4F;
 Thu,  9 Mar 2023 11:59:20 +0100 (CET)
Received: from [10.48.0.157] (10.48.0.157) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Thu, 9 Mar
 2023 11:59:17 +0100
Message-ID: <506a41d6-0ee6-0d02-2ab8-5ba4ebce2b96@foss.st.com>
Date: Thu, 9 Mar 2023 11:59:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
References: <20230308132649.355398-1-patrick.delaunay@foss.st.com>
 <20230308142555.2.Ie4c0c26b9f9564443ab4eb36059d16195af15fe5@changeid>
 <26d224e8-ef95-1380-4909-2585e0a5295a@gmx.de>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <26d224e8-ef95-1380-4909-2585e0a5295a@gmx.de>
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-09_06,2023-03-08_03,2023-02-09_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH 2/2] efi: remove error in efi_disk_remove
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


On 3/9/23 09:54, Heinrich Schuchardt wrote:
> On 3/8/23 14:26, Patrick Delaunay wrote:
>> EFI has no reason to block the driver remove when the associated EFI
>> resources failed to be released.
>>
>> This patch avoids DM issue when an EFI resource can't be released,
>> for example if this resource wasn't created, for duplicated device name
>> (error EFI_ALREADY_STARTED).
>>
>> Without this patch, the U-Boot device tree is not updated for "usb stop"
>> command because EFI stack can't free a resource; in usb_stop(), the
>> remove operation is stopped on first device_remove() error, including a
>> device_notify() error on any chil
> The typical reason to return an error here is that the EFI device is
> still in use, i.e. a protocol installed on the EFI handle is opened by a
> child controller or driver. As long as the EFI handle cannot be removed
> we must not remove the linked DM device or we corrupt our data model.
>
> Best regards
>
> Heinrich


Ok


I get it now,

Forget my serie


Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
