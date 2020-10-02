Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED4C281004
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Oct 2020 11:43:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78F04C424B0;
	Fri,  2 Oct 2020 09:43:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 456D9C424AF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Oct 2020 09:43:02 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0929NcUR002610; Fri, 2 Oct 2020 11:43:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=GKZQ1iFcZC7MGjZD4AfGoNC8gMHI6/kzZFd8mu04un8=;
 b=WFLcBtUaHL0xNiag+MC/JCxXpjfAXmc6ZeGlQu+zwykIbPW3Wk/wjQ/rtYj61V5g0aGS
 YWryB7ClnSsKyWeS001KE3ytAUj80ATIFDOkRhijy9kLY89CfrW/x6mjQ+UlTsULC67M
 yI9bkwSojrejdrkIK4zT9QJjNeUNpnOGZwHDF3d1KXg1TdoWw1kFrQPWsqhaWk8gyvB+
 QVASoJDWaG3WifZIzVJEloQ0AkF/Ajo55vz7AZTAYtO9xBklz8qnPuQPVj4e2pspn+Y5
 9VqsXCem/eyOMRBBzbe/KfoBk0O/3L4xM8S6wUzXTJ6w/RZEfhUORgaU7PPBZGjAXMDX YQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33v0dhae66-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Oct 2020 11:43:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3D1D1100034;
 Fri,  2 Oct 2020 11:43:01 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2FB4B2AD2C4;
 Fri,  2 Oct 2020 11:43:01 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 2 Oct
 2020 11:42:35 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 2 Oct 2020 11:42:35 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH] mailbox: stm32_ipcc: Convert to use APIs which support
 live DT
Thread-Index: AQHWhsCi7XV3372wIEGKYC75JKRG16mEEayA
Date: Fri, 2 Oct 2020 09:42:35 +0000
Message-ID: <5f449986-458a-6805-b752-759689b4d840@st.com>
References: <20200909154815.29020-1-patrick.delaunay@st.com>
In-Reply-To: <20200909154815.29020-1-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <7F8547EB44078B4DBA8A9864C7A78728@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-02_05:2020-10-02,
 2020-10-02 signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] mailbox: stm32_ipcc: Convert to use APIs
 which support live DT
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

On 9/9/20 5:48 PM, Patrick Delaunay wrote:
> Use ofnode_ or dev_ APIs instead of fdt_ and fdtdec_ APIs so that the
> driver can support live DT.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/mailbox/stm32-ipcc.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/mailbox/stm32-ipcc.c b/drivers/mailbox/stm32-ipcc.c
> index b8bf356b4a..81a4115986 100644
> --- a/drivers/mailbox/stm32-ipcc.c
> +++ b/drivers/mailbox/stm32-ipcc.c
> @@ -101,9 +101,8 @@ static int stm32_ipcc_probe(struct udevice *dev)
>  {
>  	struct stm32_ipcc *ipcc = dev_get_priv(dev);
>  	fdt_addr_t addr;
> -	const fdt32_t *cell;
>  	struct clk clk;
> -	int len, ret;
> +	int ret;
>  
>  	debug("%s(dev=%p)\n", __func__, dev);
>  
> @@ -114,14 +113,12 @@ static int stm32_ipcc_probe(struct udevice *dev)
>  	ipcc->reg_base = (void __iomem *)addr;
>  
>  	/* proc_id */
> -	cell = dev_read_prop(dev, "st,proc_id", &len);
> -	if (len < sizeof(fdt32_t)) {
> +	ret = dev_read_u32_index(dev, "st,proc_id", 1, &ipcc->proc_id);
> +	if (ret) {
>  		dev_dbg(dev, "Missing st,proc_id\n");
>  		return -EINVAL;
>  	}
>  
> -	ipcc->proc_id = fdtdec_get_number(cell, 1);
> -
>  	if (ipcc->proc_id >= STM32_MAX_PROCS) {
>  		dev_err(dev, "Invalid proc_id (%d)\n", ipcc->proc_id);
>  		return -EINVAL;

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
