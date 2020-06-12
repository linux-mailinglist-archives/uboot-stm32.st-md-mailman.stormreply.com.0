Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B02E1F75A3
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jun 2020 11:03:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00F47C36B0D
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jun 2020 09:03:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5556BC36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jun 2020 09:03:25 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05C8vReJ025101; Fri, 12 Jun 2020 11:03:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=tKjQEj1lkOVUfCug2jiijQl33IyEjqFz941Ohhcqudw=;
 b=EL44G2Ns5/sYsfteZzuR8UwemH6loWhR/AQxvotppRTOiAqlXXuZDmkrJJs58OJsoy7U
 ktKR/JoQwGsBVC9/YdLWDa6A58jKTe475uuqTisoNUuLWiBeoptc15cUtAmkPfPESiFP
 RzHC+3id6GC9XPWgWjJl603jwlqDx59xxnyVe3OEVVxiAdQQ6jKVTa2aKz3qkyv+jHWh
 Mz4BwJtZeOMWd2GFlXhJDuZgQV+xXeow9UPqmKi08A289eg3is4YtqWcz1sayAY0EK9i
 wVIny0X/JYrPQnZ1faLT9EK9UrqrcQ/MBM/YGSWTihS1cycQ8/NwdZ72NLMx6kA1sId/ mQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31g097qcxa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jun 2020 11:03:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 51B2B10002A;
 Fri, 12 Jun 2020 11:03:14 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3A9C12BC7A6;
 Fri, 12 Jun 2020 11:03:14 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 12 Jun
 2020 11:03:13 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 12 Jun 2020 11:03:13 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>, Tom Rini
 <trini@konsulko.com>
Thread-Topic: [PATCH] optee: fix copy of optee reserved-memory node
Thread-Index: AQHWOwoULwSOO6xZpEqbEx+RaNVl/ajUtmuw
Date: Fri, 12 Jun 2020 09:03:13 +0000
Message-ID: <3bf217694d914ca6ae8626c3a0c395e1@SFHDAG6NODE3.st.com>
References: <20200605092205.1.Ibab98d647c5748ec387b62823fa04035ac0afd74@changeid>
In-Reply-To: <20200605092205.1.Ibab98d647c5748ec387b62823fa04035ac0afd74@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-12_07:2020-06-11,
 2020-06-12 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Christophe PRIOUZEAU <christophe.priouzeau@st.com>,
 Etienne Carriere <etienne.carriere@linaro.org>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Subject: Re: [Uboot-stm32] [PATCH] optee: fix copy of optee reserved-memory
	node
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

Hi Tom,

> From: Patrick DELAUNAY <patrick.delaunay@st.com>
> Sent: vendredi 5 juin 2020 09:22
> 
> From: Etienne Carriere <etienne.carriere@linaro.org>
> 
> Fix the loop that parses FDT for a reserved memory node named "optee".
> 
> Before this change, if at least one subnode was found in the reserved-memory
> node, the function endlessly looped since instruction continue returned back in the
> loop without updating variable subnode.
> This change fixes the issue by using a for loop.
> 
> Fixes: 6ccb05eae01b ("image: fdt: copy possible optee nodes to a loaded
> devicetree")
> Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 
>  lib/optee/optee.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/optee/optee.c b/lib/optee/optee.c index e59b5766e7..457d4cca8a
> 100644
> --- a/lib/optee/optee.c
> +++ b/lib/optee/optee.c
> @@ -156,8 +156,9 @@ int optee_copy_fdt_nodes(const void *old_blob, void
> *new_blob)
>  	/* optee inserts its memory regions as reserved-memory nodes */
>  	nodeoffset = fdt_subnode_offset(old_blob, 0, "reserved-memory");
>  	if (nodeoffset >= 0) {
> -		subnode = fdt_first_subnode(old_blob, nodeoffset);
> -		while (subnode >= 0) {
> +		for (subnode = fdt_first_subnode(old_blob, nodeoffset);
> +		     subnode >= 0;
> +		     subnode = fdt_next_subnode(old_blob, subnode)) {
>  			const char *name = fdt_get_name(old_blob,
>  							subnode, NULL);
>  			if (!name)
> @@ -197,8 +198,6 @@ int optee_copy_fdt_nodes(const void *old_blob, void
> *new_blob)
>  				if (ret < 0)
>  					return ret;
>  			}
> -
> -			subnode = fdt_next_subnode(old_blob, subnode);
>  		}
>  	}
> 
> --
> 2.17.1

Do you think it is possible to include this fix in v2020.07 ?
Or do you expect some review ?

This issue blocks the STM32MP1 boot with OP-TEE...
as subnode is not update if the first reserved node is not "optee" one, 
with:

	if (strncmp(name, "optee", 5))
		continue;

for example DT =

reserved-memory {
	gpu_reserved: gpu@da000000 {
		reg = <0xda000000 0x4000000>;
		no-map;
	};

	optee@de000000 {
		reg = <0xde000000 0x02000000>;
		no-map;
	};
};

See also http://patchwork.ozlabs.org/project/uboot/list/?series=181471


Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
