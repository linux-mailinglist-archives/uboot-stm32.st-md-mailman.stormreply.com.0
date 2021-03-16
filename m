Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B92533D50C
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Mar 2021 14:41:08 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5D1EC57B77;
	Tue, 16 Mar 2021 13:41:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80B7CC56632
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Mar 2021 13:41:06 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12GDbt5u010063; Tue, 16 Mar 2021 14:41:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=7zNAYIsuziHZef3I1mU4m8hd8SKobzJW+ZXAqhPJPvk=;
 b=pci4TjRudi+vYSvmSQFu9VR4kCyVdr/XnGavSif24vviOnbT+OBL2MrWGYCyfq0fVmKL
 x4+l7F2h1HpxJEk2Wy3WalyUaEnzLaNrEYUla5waskLcEOkcZvHPJw/wFuDRVx74gEsA
 kladNapqfzgvgOlPc3q9BCiGNIU6cAqEp/VV4mA+nwGulQl+XAkC0cld8kXwbxfrAIia
 3i5ttGVNyeDrr/7oNC2htjNySEH56YBamIW9R2wTbYZVWZiEVVr98DWQwLWlKU4uv5JN
 ROcwqrg6sTP/saXQLLxPE+u14Qiu8z2Cxw2zAxI8321Vmp0/1OPLRr/XjStEgkiS6QzR tQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37agam47sn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Mar 2021 14:41:02 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B4F1B10002A;
 Tue, 16 Mar 2021 14:41:01 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8C1C5231DFC;
 Tue, 16 Mar 2021 14:41:01 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.45) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 16 Mar
 2021 14:41:00 +0100
To: Jagan Teki <jagan@amarulasolutions.com>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Matteo Lisi <matteo.lisi@engicam.com>
References: <20210315173256.103731-1-jagan@amarulasolutions.com>
 <20210315173256.103731-7-jagan@amarulasolutions.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <f9a0fc31-1bdd-76c0-1f9f-ac5284021af9@foss.st.com>
Date: Tue, 16 Mar 2021 14:40:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210315173256.103731-7-jagan@amarulasolutions.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-16_04:2021-03-16,
 2021-03-16 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 linux-amarula@amarulasolutions.com
Subject: Re: [Uboot-stm32] [PATCH v2 6/9] ARM: dts: stm32: Add Engicam
 MicroGEA STM32MP1 Micro SoM
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

Hi Jagan,

On 3/15/21 6:32 PM, Jagan Teki wrote:
> MicroGEA STM32MP1 is a STM32MP157A based Micro SoM.
>
> General features:
> - STM32MP157AAC
> - Up to 1GB DDR3L-800
> - 512MB Nand flash
> - I2S
>
> MicroGEA STM32MP1 needs to mount on top of Engicam MicroDev carrier
> boards for creating complete platform solutions.
>
> Linux dts commit details:
>
> commit <0be81dfaeaf8> ("ARM: dts: stm32: Add Engicam MicroGEA STM32MP1
> SoM")
>
> Add support for it.
>
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v2:
> - collect Patrice r-b
> - add linux dts commit
> - drop CONFIG_BOARD_EARLY_INIT_F
>
>   .../dts/stm32mp157a-microgea-stm32mp1.dtsi    | 148 ++++++++++++++++++
>   1 file changed, 148 insertions(+)
>   create mode 100644 arch/arm/dts/stm32mp157a-microgea-stm32mp1.dtsi

Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
