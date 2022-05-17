Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E56529C4B
	for <lists+uboot-stm32@lfdr.de>; Tue, 17 May 2022 10:24:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B56CC5F1D3;
	Tue, 17 May 2022 08:24:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EBF34C5EC6B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 May 2022 08:24:38 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24H6fjTS029143;
 Tue, 17 May 2022 10:24:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=qj/uVeoDok4FRA7uXhBYVN/2bqfi90CYJcE6Cfin6+g=;
 b=PdYtO75eKetKuNTsOHlfh0OCX5K2YDPvRNuc/miQLwMYgnpsOtG/mshe59WisMkS/p0H
 wTAb5Stc8uGMtr+tzz0AYejLRBLC3OiKsb97k3BuqFpNW1O/tCjQZlUYrTGdBktMW2Iq
 aBLzYSpWMMiKmEhrj0tAjuQ8NtYaEN05u01qXPyvyTfaO4w6NJzSHJvAxMoCVZDXG4aG
 NySux1cQM6xujINcnCTrPdgS8BhroZS53+wxmuI84encqyAVtpEwZz8W/saphiNI3snX
 rrNGywGb3pWudx+7jg1iGlVfavVrvoiI7ajChQCjJ5YlojGWhde6TspMx/YwrSS2cxdX jQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g21j8rsbg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 May 2022 10:24:37 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5FFAF10002A;
 Tue, 17 May 2022 10:24:37 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 58F44214D24;
 Tue, 17 May 2022 10:24:37 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.50) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 17 May
 2022 10:24:36 +0200
Message-ID: <45c9f2be-df7b-2caf-3142-21ea27c987ca@foss.st.com>
Date: Tue, 17 May 2022 10:24:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20220512071738.741406-1-patrice.chotard@foss.st.com>
 <20220512071738.741406-3-patrice.chotard@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220512071738.741406-3-patrice.chotard@foss.st.com>
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-17_01,2022-05-16_02,2022-02-23_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [Uboot-stm32] [PATCH v1 2/2] spi: stm32_qspi: Remove SR_BUSY
 bit check before sending command
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

Hi Patrice

On 5/12/22 09:17, Patrice Chotard wrote:
> Waiting for SR_BUSY bit when receiving a new command is not needed.
> SR_BUSY bit is already managed in the previous command treatment.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>
> ---
>
>   drivers/spi/stm32_qspi.c | 4 ----
>   1 file changed, 4 deletions(-)
>
> diff --git a/drivers/spi/stm32_qspi.c b/drivers/spi/stm32_qspi.c
> index 3c8faecb54..ceba413727 100644
> --- a/drivers/spi/stm32_qspi.c
> +++ b/drivers/spi/stm32_qspi.c
> @@ -255,10 +255,6 @@ static int stm32_qspi_exec_op(struct spi_slave *slave,
>   		op->dummy.buswidth, op->data.buswidth,
>   		op->addr.val, op->data.nbytes);
>   
> -	ret = _stm32_qspi_wait_for_not_busy(priv);
> -	if (ret)
> -		return ret;
> -
>   	addr_max = op->addr.val + op->data.nbytes + 1;
>   
>   	if (op->data.dir == SPI_MEM_DATA_IN && op->data.nbytes) {


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
