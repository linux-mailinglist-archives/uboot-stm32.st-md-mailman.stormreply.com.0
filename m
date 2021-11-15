Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 415304503AE
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Nov 2021 12:40:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07E2DC5C82B;
	Mon, 15 Nov 2021 11:40:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83B54C5C82A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Nov 2021 11:40:13 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AF8smK7006691;
 Mon, 15 Nov 2021 12:40:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=6spINsG+0H2BHqrJk50bN9yenpO8V3Ryb86VvNXBKk4=;
 b=UKcY8VplgwaTmdiIRn8Y1DHFc+MNSaiUM6FwvADPxvzVfdQr2ad3Rhf28NgEawUrM25N
 lr2KwtRXyxYcFg2W37m1QydqOoH9lj2kuCWpVQAHCms2ZXl/EMUHfPvbSiCJMwdj2v5/
 xtdsVQrAeTXIs30falpHVYjpUS+Np9aH610nnUPn7GTssHbYhf66ArDYLy24520fA/a+
 Tex9RRPpF4b0sgihrJGRIgsCrdMpozh0LdAQGIgPj9THc5wYkhjyDVHErOoHM7xveGk1
 TFR5RV/HMbdqBC9i85C9y+ijKXhbXmF0lVZIijiLubGd8R6uRDvI2xObYOqj8joKz2gK AA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cbmf410as-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Nov 2021 12:40:12 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E317A10002A;
 Mon, 15 Nov 2021 12:40:11 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DB06A21A21A;
 Mon, 15 Nov 2021 12:40:11 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.50) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 15 Nov
 2021 12:40:11 +0100
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20211115103920.30149-1-patrice.chotard@foss.st.com>
 <20211115103920.30149-9-patrice.chotard@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <1c87eeef-dddb-38bd-d2ee-22ea6421cd13@foss.st.com>
Date: Mon, 15 Nov 2021 12:40:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211115103920.30149-9-patrice.chotard@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-15_10,2021-11-15_01,2020-04-07_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 8/8] ARM: dts: stm32: Use lower-case hex
 for address for stm32429i-eval-u-boot.dtsi
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

Hi,

On 11/15/21 11:39 AM, Patrice Chotard wrote:
> Replace upper-case hex with lower-case hex for address.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>
> ---
>
>   arch/arm/dts/stm32429i-eval-u-boot.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick



_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
