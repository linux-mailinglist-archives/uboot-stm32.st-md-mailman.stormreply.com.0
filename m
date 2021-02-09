Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A6197314BA5
	for <lists+uboot-stm32@lfdr.de>; Tue,  9 Feb 2021 10:33:57 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 724EBC57B53;
	Tue,  9 Feb 2021 09:33:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66F14C57189
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Feb 2021 09:33:55 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1199SQSs026924; Tue, 9 Feb 2021 10:33:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=4PfPuWBBNpZ4GO65J2VPkVprMhOVqN0zFVlZWcB0EHU=;
 b=YQFy+ClKn3wyxGwwSZ0uVtkRuv53pGFrTUj6rP2UF/+NF2+KlK/Td+7fvYAI6aIl/1j7
 1TWoQbZ9sF5c77luh1dacwKuXuaDTBVfh4CFTAKNiKkMrbUU/bI4BkAKySkEPSrdcl8m
 LkLVMe/GgQ6Pb5j8gAb7mIgwY/R/AOjbSlgqvU/ZPOr0+T0LoKkcVvwHMsWgGnv1ya/m
 hP+WCtsbokmXDM/1yNdLNKJ3EseSrJPMELW6JP3QC4JSGaRLWs2/3aVtghK1nqhTB6bU
 eVhWXmcHN9nmB3iblNB8VWfg9qpaWNuPcdlZqjkaxnv6dP/16d27MuupISQRYl7oN8h6 qg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36hrauqnnn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Feb 2021 10:33:54 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1868910002A;
 Tue,  9 Feb 2021 10:33:54 +0100 (CET)
Received: from Webmail-eu.st.com (gpxdag2node6.st.com [10.75.127.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0F337221765;
 Tue,  9 Feb 2021 10:33:54 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.116) by GPXDAG2NODE6.st.com
 (10.75.127.70) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 9 Feb
 2021 10:33:53 +0100
To: <u-boot@lists.denx.de>
References: <20210121163908.17678-1-patrick.delaunay@foss.st.com>
 <20210121173856.2.I0a3428974f4b9205c6a22076bf60c87639520b20@changeid>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <4e72ad8b-7c48-26c8-9a88-57e05e627ed5@foss.st.com>
Date: Tue, 9 Feb 2021 10:33:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210121173856.2.I0a3428974f4b9205c6a22076bf60c87639520b20@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.116]
X-ClientProxiedBy: GPXDAG3NODE6.st.com (10.75.127.73) To GPXDAG2NODE6.st.com
 (10.75.127.70)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-09_02:2021-02-09,
 2021-02-09 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] pinctrl: stm32: bind only the enabled
	GPIO subnode
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

On 1/21/21 5:39 PM, Patrick Delaunay wrote:
> Bind only the enabled GPIO subnode, to avoid to probe the node
> "gpio-controller" present in SOC dtsi (disabled by default) but
> not enabled in the included pincontrol dtsi file.
>
> For example, in stm32mp15xxac-pinctrl.dtsi 2 gpio bank are absent:
>   gpioj: gpio@5000b000
>   gpiok: gpio@5000c000
>
> Then these GPIO are absent in output of command "dm tree" and
> "gpio status -a"
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>   drivers/pinctrl/pinctrl_stm32.c | 3 +++
>   1 file changed, 3 insertions(+)
>
Applied to u-boot-stm/master, thanks!

Regards

Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
