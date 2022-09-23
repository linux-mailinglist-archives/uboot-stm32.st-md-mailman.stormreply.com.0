Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFCA5E7A15
	for <lists+uboot-stm32@lfdr.de>; Fri, 23 Sep 2022 14:01:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD232C0D2C2;
	Fri, 23 Sep 2022 12:01:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 938CEC0D2C1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Sep 2022 12:01:17 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28NA6ETP018770;
 Fri, 23 Sep 2022 14:01:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=sOvK05vZgnJ2oC2za+NNcIyFVMOLZcptGTTYES3uaLs=;
 b=dj+7WWmDfa6R1oLnBMyyQpxdAicANCmvjFqCE+185UmWnYnqOr6j+f6VLCc0WfLI1HcA
 +7e59ab8qB1HkRdvj1hyPL9rodc1SFDYohnIspc0Ae7uXautctGSeZMwhNVqHzQmO51X
 IOoYS9fEjjDe+RPYnWfXsOGCes1UGsTwK2Pl3M0HLDJnWLXUGw4WzRcXiB+BWwEn3s3d
 eZVqOfLeHCYymf/bUsVuPLUrSZwgHMGaZ9iCpwFeeIRQyt6k5M0Fok3V/jPDfz45SluH
 ZX66ZCPOCk7bLjOIHsQqBmppFachuhT8VrR9Kzu0VZE+BMa9Onxtv8dEbjSky+hH6mef Eg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jr11xfers-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Sep 2022 14:01:16 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 14DFC100034;
 Fri, 23 Sep 2022 14:01:15 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 99F4D228A2D;
 Fri, 23 Sep 2022 14:01:15 +0200 (CEST)
Received: from [10.201.21.72] (10.75.127.48) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Fri, 23 Sep
 2022 14:01:15 +0200
Message-ID: <29e6828a-07be-243a-4880-d519f78a9502@foss.st.com>
Date: Fri, 23 Sep 2022 14:01:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220906185314.1.I9928b88f3a453611043b484158b02efe9b0c06bf@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220906185314.1.I9928b88f3a453611043b484158b02efe9b0c06bf@changeid>
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-23_04,2022-09-22_02,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 1/4] stm32mp: stm32prog: support empty
	flashlayout
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

For the series: applied on u-boot-stm32/next

Thanks
Patrice

On 9/6/22 18:53, Patrick Delaunay wrote:
> When the STM32CubeProgrammer sent a empty flashlayout.tsv
> file, the command stm32prog correctly parse the file
> but data->dev_nb = 0 and the stm32prog_devices_init
> operations should be skipped.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> index c391b6c7abb..65e32288af7 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> @@ -1884,6 +1884,10 @@ static void stm32prog_devices_init(struct stm32prog_data *data)
>  	if (ret)
>  		goto error;
>  
> +	/* empty flashlayout */
> +	if (!data->dev_nb)
> +		return;
> +
>  	/* initialize the selected device */
>  	for (i = 0; i < data->dev_nb; i++) {
>  		ret = init_device(data, &data->dev[i]);
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
