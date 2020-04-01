Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD8B19A6DF
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Apr 2020 10:09:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E0B8C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Apr 2020 08:09:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25176C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2020 08:09:24 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03188qFY022511; Wed, 1 Apr 2020 10:09:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=eF3por4r4Nr6SQINlh8ftJrlV3JbPSlkT4XN8VQw3Kw=;
 b=jbznD3UpZv5o5NXaZceBF+jXPeE4UIQAV2TmliF5nzO/J4HwR4DCiXETq6DnKHxTWnUW
 ae7H7y0OEZn+l6DeL34bVlPrIzp71AEASS80V/BFr2qKMKEbzIbWiZk6qvZJz4xqaGvf
 w/ffXtKJquF7A6ffhKVdFLxaqrvOBDxoeV5Kv8t0uyWJHqy3W1wi40r/R+AW5YFdmxKO
 o6tcAZQ6q1zQV5IiRmoMQxex82OVjrkl4qNHKmNYhtVXWa0Fnphg8D2bNM4IWbggG/oj
 c4aw652YfRdimQYQAlnus4s1gKNk3cJcD/wD2VoPplKlZDSLWvE3RonfsLrPmgu18JSx /Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 302y53wu3d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 10:09:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A47DD10002A;
 Wed,  1 Apr 2020 10:09:18 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9B2B72126A1;
 Wed,  1 Apr 2020 10:09:18 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 1 Apr
 2020 10:09:18 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 1 Apr 2020 10:09:18 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 16/16] configs: stm32mp1: activate
 CONFIG_ERRNO_STR
Thread-Index: AQHWB/zXULTtE5i1/UiqfwojbjRifQ==
Date: Wed, 1 Apr 2020 08:09:18 +0000
Message-ID: <a573dea2-82ff-a2f9-1bf3-04903a748b3a@st.com>
References: <20200331180330.1.Ied6708bad5048382a57618f95d67c549aae49f42@changeid>
 <20200331180330.16.Ie45c9b3aed36a3a582774fa1dffcea89d2c4bcf4@changeid>
In-Reply-To: <20200331180330.16.Ie45c9b3aed36a3a582774fa1dffcea89d2c4bcf4@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <C5A09E729F71F4409A4265C24E779036@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_07:2020-03-31,
 2020-03-31 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 16/16] configs: stm32mp1: activate
 CONFIG_ERRNO_STR
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

On 3/31/20 6:04 PM, Patrick Delaunay wrote:
> Add support of errno_str, used in command pmic and regulator.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  configs/stm32mp15_basic_defconfig   | 1 +
>  configs/stm32mp15_trusted_defconfig | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
> index 30cfb8d8e1..8a6201bc48 100644
> --- a/configs/stm32mp15_basic_defconfig
> +++ b/configs/stm32mp15_basic_defconfig
> @@ -144,4 +144,5 @@ CONFIG_VIDEO_STM32=y
>  CONFIG_VIDEO_STM32_DSI=y
>  CONFIG_VIDEO_STM32_MAX_XRES=1280
>  CONFIG_VIDEO_STM32_MAX_YRES=800
> +CONFIG_ERRNO_STR=y
>  CONFIG_FDT_FIXUP_PARTITIONS=y
> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
> index aefad2b109..394df39d0a 100644
> --- a/configs/stm32mp15_trusted_defconfig
> +++ b/configs/stm32mp15_trusted_defconfig
> @@ -127,4 +127,5 @@ CONFIG_VIDEO_STM32=y
>  CONFIG_VIDEO_STM32_DSI=y
>  CONFIG_VIDEO_STM32_MAX_XRES=1280
>  CONFIG_VIDEO_STM32_MAX_YRES=800
> +CONFIG_ERRNO_STR=y
>  CONFIG_FDT_FIXUP_PARTITIONS=y

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
