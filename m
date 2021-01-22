Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D873B2FFE38
	for <lists+uboot-stm32@lfdr.de>; Fri, 22 Jan 2021 09:33:50 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A4C68C3FADC;
	Fri, 22 Jan 2021 08:33:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31BA2C3FADB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Jan 2021 08:33:48 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10M8VRh1003055; Fri, 22 Jan 2021 09:33:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=KtBh5BBWGK2nm5VD8gTx4gsskcuPyGjCxJ72lVdCgZ0=;
 b=OIpjCHzcFjsJd2IxRIhvLCsNfMxj+6xZg7Cve6ql26B6O8PmogKR+MV1/uiFVULhBHTH
 0xMui8C9epbxDg/QyOo87LthLBBx191Rt7rqXh3XVR6Sd/QgIPv/a0cTlwx09L6fo470
 Rj5si0orogfrCkd0GVQFl1Fp0Rb5hGFcoSDMDsOERw0bko7hwzRtMTPQrJXtxeKInOj9
 r4QUXt1z+d/dpFyHV5NKhVe19a+5oZzIwOVKM913NRzKJp58vZzAX+jZKGdGy+9BcHh6
 Q0IJNf/Y/D2sSPrBo/VDvUMuJW8HPd8OjW6rups5j3/QqcKtsziEr6L+oa4W2T+mJNAb Bw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3668pe0fkn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jan 2021 09:33:47 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A236A10002A;
 Fri, 22 Jan 2021 09:33:46 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 985CE21E696;
 Fri, 22 Jan 2021 09:33:46 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 22 Jan
 2021 09:33:46 +0100
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210121163908.17678-1-patrick.delaunay@foss.st.com>
 <20210121173856.2.I0a3428974f4b9205c6a22076bf60c87639520b20@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <2ed6d99d-90cc-6e08-1966-b415839301d8@foss.st.com>
Date: Fri, 22 Jan 2021 09:33:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210121173856.2.I0a3428974f4b9205c6a22076bf60c87639520b20@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-22_03:2021-01-21,
 2021-01-22 signatures=0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi Patrick

On 1/21/21 5:39 PM, Patrick Delaunay wrote:
> Bind only the enabled GPIO subnode, to avoid to probe the node
> "gpio-controller" present in SOC dtsi (disabled by default) but
> not enabled in the included pincontrol dtsi file.
> 
> For example, in stm32mp15xxac-pinctrl.dtsi 2 gpio bank are absent:
>  gpioj: gpio@5000b000
>  gpiok: gpio@5000c000
> 
> Then these GPIO are absent in output of command "dm tree" and
> "gpio status -a"
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  drivers/pinctrl/pinctrl_stm32.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/pinctrl/pinctrl_stm32.c b/drivers/pinctrl/pinctrl_stm32.c
> index 374f76d881..6c98538f56 100644
> --- a/drivers/pinctrl/pinctrl_stm32.c
> +++ b/drivers/pinctrl/pinctrl_stm32.c
> @@ -409,6 +409,9 @@ static int stm32_pinctrl_bind(struct udevice *dev)
>  	dev_for_each_subnode(node, dev) {
>  		dev_dbg(dev, "bind %s\n", ofnode_get_name(node));
>  
> +		if (!ofnode_is_enabled(node))
> +			continue;
> +
>  		ofnode_get_property(node, "gpio-controller", &ret);
>  		if (ret < 0)
>  			continue;
> 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
