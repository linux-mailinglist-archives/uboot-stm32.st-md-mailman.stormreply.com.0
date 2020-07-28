Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A97A32305D4
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 10:54:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65ADEC36B25
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 08:54:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7DDBC36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jul 2020 08:54:24 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06S8qL2T025751; Tue, 28 Jul 2020 10:54:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=xNLfJ9q11E7CtbFv30tBzoNdCxa7oZDYG/ZEjjetThA=;
 b=iXcTXKW9jms17evg60CTjESZ5TZm9s6kbc6cGR0I8DOkvOGj3pdwGghDNEc380ZmLVXS
 RPdioCn8EIV0R/DL825NfGfPVqmOWbxB5HDqxMDtMqD9TmVRcWpZtg3oyzpNpOYtAvWC
 I5waPdRTcJea5bjtGlHbMS9fXEdu1azZkpOSFVTXP55lYxxkmWPsPS1Hl/mzVOT1LBot
 98l6VkgLk5RH+QJ6iky39nF69lzatAvkZGO2yjtoVaoNAJErMskBr/hYUyvrBPfYSZbY
 lcM6IP5KsUZMkLWMOmONoQ2uPzGbS45xjiWY4DVB8qcObGa0pd3caACbEnp3J6ueEnY+ NQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32ga71wb5q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jul 2020 10:54:21 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 48B4610002A;
 Tue, 28 Jul 2020 10:54:18 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3703E2A4D84;
 Tue, 28 Jul 2020 10:54:18 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Jul
 2020 10:54:17 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 28 Jul 2020 10:54:17 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH] usb: host: dwc3-sti-glue: Fix ofnode_valid() parameter
Thread-Index: AQHWTfdoFA3CWL+7/USDVsIdwP6hAakcu+OA
Date: Tue, 28 Jul 2020 08:54:17 +0000
Message-ID: <7a656b7e-4a15-4bd6-54ba-6dc87f2c9b81@st.com>
References: <20200629092633.24545-1-patrice.chotard@st.com>
In-Reply-To: <20200629092633.24545-1-patrice.chotard@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <A14C78261BC27B4A854E46CB650F9077@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-28_01:2020-07-28,
 2020-07-28 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marex@denx.de>, Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH] usb: host: dwc3-sti-glue: Fix
	ofnode_valid() parameter
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

Hi

Just a gentle reminder as this patch is present on mailing list since 2 months.

Regards

Patrice

On 6/29/20 11:26 AM, Patrice Chotard wrote:
> node varaible is used as iterator into ofnode_for_each_subnode()
> loop, when exiting of it, node is no more a valid ofnode.
> Use dwc3_node instead as parameter of ofnode_valid()
>
> Fixes: ac28e59a574d ("usb: Migrate to support live DT for some driver")
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> ---
>
>  drivers/usb/host/dwc3-sti-glue.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/usb/host/dwc3-sti-glue.c b/drivers/usb/host/dwc3-sti-glue.c
> index a72ab20168..3e6c1429d6 100644
> --- a/drivers/usb/host/dwc3-sti-glue.c
> +++ b/drivers/usb/host/dwc3-sti-glue.c
> @@ -159,7 +159,7 @@ static int sti_dwc3_glue_bind(struct udevice *dev)
>  			dwc3_node = node;
>  	}
>  
> -	if (!ofnode_valid(node)) {
> +	if (!ofnode_valid(dwc3_node)) {
>  		pr_err("Can't find dwc3 subnode for %s\n", dev->name);
>  		return -ENODEV;
>  	}
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
