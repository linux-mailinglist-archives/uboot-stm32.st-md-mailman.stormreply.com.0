Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E63354E00
	for <lists+uboot-stm32@lfdr.de>; Tue,  6 Apr 2021 09:40:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B69FC57A41;
	Tue,  6 Apr 2021 07:40:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F215C5718B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Apr 2021 07:40:52 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1367cDlU006952; Tue, 6 Apr 2021 09:40:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=7gkblMxP/wkd78L/UkTLN1QVrUQXt8LOCtOvZX5RkKs=;
 b=cWjYtPJi8qtRK76PjXrfJ/RHb3t9BjKlLE8iG2holytmmIOyXeiNMbicSD84/8thD/1E
 LQDMEjgKBALHQ+TCqiiyhaZRwYfaeJb1mwh4Pj1b0t1s7Z1KUZihrDwE+kufujN1MvbN
 ycHgS9sSXYmcnXQN1a4ydcIMbkr3FIunSLlzI6+JwJOIRQib8EfgRibdV/m3N2rJZeEU
 FgfaJdb/zwL8U28uCUP6u4EV/rYmAX4F0jR/FnQ5QtzC2FKuwuTM05bZmxYD3HXnMDL/
 6EXhTJeZsjTVIXDegWxk7rdbF4kqOicF0Gw/PeqHjsHGoxPO2C1M6/xdi2EaHrhmwFhj tA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37r3d23y7a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Apr 2021 09:40:50 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E0FE910002A;
 Tue,  6 Apr 2021 09:40:49 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D432F21EACA;
 Tue,  6 Apr 2021 09:40:49 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 6 Apr
 2021 09:40:49 +0200
To: <u-boot@lists.denx.de>
References: <20210330152813.1.I5743d7539eaa2c2c5a15114120d50ef8eece1431@changeid>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <bf75d879-6751-4196-9a29-70a2ffbde7f2@foss.st.com>
Date: Tue, 6 Apr 2021 09:40:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210330152813.1.I5743d7539eaa2c2c5a15114120d50ef8eece1431@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-04-06_01:2021-04-01,
 2021-04-06 signatures=0
Cc: Simon Glass <sjg@chromium.org>, Sean Anderson <seanga2@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Etienne Carriere <etienne.carriere@linaro.org>,
 Etienne CARRIERE <etienne.carriere@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] scmi: translate the resource only when
 livetree is not activated
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

On 3/30/21 3:29 PM, Patrick Delaunay wrote:
> Call the translation function on the ofnode_read_resource result only
> when the livetree is not activated.
>
> Today of_address_to_resource() calls ofnode_read_resource() for livetree
> support and fdt_get_resource() when livetree is not supported.
>
> The fdt_get_resource() doesn't do the address translation
> so when it is required when livetree is activated but this address
> translation is already done by ofnode_read_resource().
>
> Fixes: 240720e9052f ("firmware: scmi: mailbox/smt agent device")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> Hi,
>
> This patch is a short-term workaround for ofnode_read_resource translation
> issue on stm32mp15 boards when scmi is used and OF_LIVE is activated.
>
> A full solution is a patch in core to have the same behavior of the API
> ofnode_read_resource() when livretree is activated or not:
>
> fdt_get_resource()
>    ...
>          while (ptr + na + ns <= end) {
>                  if (i == index) {
>    -                     res->start = fdtdec_get_number(ptr, na);
>    +                     if (CONFIG_IS_ENABLED(OF_TRANSLATE))
>    +                             res->start = fdt_translate_address(fdt, node, ptr);
>    +                     else
>    +                             res->start = fdtdec_get_number(ptr, na);
>    +
>
> I will propose it soon but it is more aggressive and impacts all the user
> of fdt_get_resource() or fdt_get_named_resource() function;
> this correct patch need more tests.


For information the proposed patch with a full correction in dm core is 
now available:

"dm: core: Add address translation in fdt_get_resource"

http://patchwork.ozlabs.org/project/uboot/list/?series=237557&state=*


> So I think it will take many time to be integrated so I prefer to
> propose the current patch for a short term integration on
> v2021.07.
>
> Patrick
>
>
>   drivers/firmware/scmi/smt.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/firmware/scmi/smt.c b/drivers/firmware/scmi/smt.c
> index 4954355c1a..f1915c0074 100644
> --- a/drivers/firmware/scmi/smt.c
> +++ b/drivers/firmware/scmi/smt.c
> @@ -41,8 +41,13 @@ int scmi_dt_get_smt_buffer(struct udevice *dev, struct scmi_smt *smt)
>   	if (ret)
>   		return ret;
>   
> -	faddr = cpu_to_fdt32(resource.start);
> -	paddr = ofnode_translate_address(args.node, &faddr);
> +	/* TEMP workaround for ofnode_read_resource translation issue */
> +	if (of_live_active()) {
> +		paddr = resource.start;
> +	} else {
> +		faddr = cpu_to_fdt32(resource.start);
> +		paddr = ofnode_translate_address(args.node, &faddr);
> +	}
>   
>   	smt->size = resource_size(&resource);
>   	if (smt->size < sizeof(struct scmi_smt_header)) {


Regards

Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
