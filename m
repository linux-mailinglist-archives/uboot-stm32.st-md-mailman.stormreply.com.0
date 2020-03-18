Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EB8189809
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 10:39:46 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8CC12C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 09:39:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F488C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2020 09:39:45 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02I9cxMj023176; Wed, 18 Mar 2020 10:39:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=oVqtUSGXqKYlx3rSPuPsER6UoUSf4v5g3sItcnC3rqw=;
 b=VkXBjs5O1yMs91kEBZfYOKs7TSLo4yT+JGMI/s4RtOFULXhLt/BLu64TyyUJe6FrSDjd
 ca9PeJ8gWdQO5T6VZaA0XfF3bq1+NTzvv/tU4Wf96vrrKmszqU8UKt49rwG7BRl5o8eZ
 FizK13mgQPAPpoNCwmEpvB6dt4BFWmZAfA+nwBkJOuPa2wLRMdqW5kTDTFGVS22ntDMo
 D67pQvVdTgZFOolS3oRDclHH3AyhLcJshaNn2iYxldzCXQ5kaS8s/JE7bw+Ogo7aPcIX
 19uYCKmCkfmWcjE7DSGl3u4FrdkkvBeaa1snaD8veLtUa0jcfA4Mg+oLZqGoZqKNwpR2 GQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yua4wa8sy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 10:39:44 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 12B4E100038;
 Wed, 18 Mar 2020 10:39:44 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0442C21FE95;
 Wed, 18 Mar 2020 10:39:44 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 18 Mar
 2020 10:39:43 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 18 Mar 2020 10:39:43 +0100
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 2/9] ram: stm32mp1: display result for software read DQS
 gating
Thread-Index: AQHV86AH52yEmk4aBE25C6UaVqjuAqhOGkqA
Date: Wed, 18 Mar 2020 09:39:43 +0000
Message-ID: <f047ca21-8749-e16b-8fbc-033fad0a23ea@st.com>
References: <20200306101412.15376-1-patrick.delaunay@st.com>
 <20200306111355.2.I7aa349c91deffa4a6f096fbadfa22b01844a7c4d@changeid>
In-Reply-To: <20200306111355.2.I7aa349c91deffa4a6f096fbadfa22b01844a7c4d@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <7FD746734FDDF74B8915B3B2813CC1BF@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_03:2020-03-17,
 2020-03-18 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 2/9] ram: stm32mp1: display result for
 software read DQS gating
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


On 3/6/20 11:14 AM, Patrick Delaunay wrote:
> Display result information for software read DQS gating, the tuning 0
> which be used by CubeMX DDR tuning tools.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/ram/stm32mp1/stm32mp1_tuning.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/ram/stm32mp1/stm32mp1_tuning.c b/drivers/ram/stm32mp1/stm32mp1_tuning.c
> index 4e1c1fab54..e3e6f0f79c 100644
> --- a/drivers/ram/stm32mp1/stm32mp1_tuning.c
> +++ b/drivers/ram/stm32mp1/stm32mp1_tuning.c
> @@ -1182,15 +1182,17 @@ static u8 set_midpoint_read_dqs_gating(struct stm32mp1_ddrphy *phy, u8 byte,
>  				 dqs_gate_values[byte][0],
>  				 dqs_gate_values[byte][1]);
>  			pr_debug("*******the nominal values were system latency: 0  phase: 2*******\n");
> -			set_r0dgsl_delay(phy, byte, dqs_gate_values[byte][0]);
> -			set_r0dgps_delay(phy, byte, dqs_gate_values[byte][1]);
>  		}
>  	} else {
>  		/* if intermitant, restore defaut values */
>  		pr_debug("dqs gating:no regular fail/pass/fail found. defaults values restored.\n");
> -		set_r0dgsl_delay(phy, byte, 0);
> -		set_r0dgps_delay(phy, byte, 2);
> +		dqs_gate_values[byte][0] = 0;
> +		dqs_gate_values[byte][1] = 2;
>  	}
> +	set_r0dgsl_delay(phy, byte, dqs_gate_values[byte][0]);
> +	set_r0dgps_delay(phy, byte, dqs_gate_values[byte][1]);
> +	printf("Byte %d, R0DGSL = %d, R0DGPS = %d\n",
> +	       byte, dqs_gate_values[byte][0], dqs_gate_values[byte][1]);
>  
>  	/* return 0 if intermittent or if both left_bound
>  	 * and right_bound are not found

Acked-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
