Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8721A9438
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Apr 2020 09:27:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B3A8C36B0B
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Apr 2020 07:27:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8130DC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Apr 2020 07:27:50 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03F7N5sO000883; Wed, 15 Apr 2020 09:27:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=mWLIcB5hn8taoJJ00TOvB3l7p6XNFNkvQlRL88/Mz30=;
 b=JBJn7fXSu6GzW7w/mC8s2bXjnVFbkI+1NhpeHZnNt8jxNT5eKNi3g77HoNA3v010ZY4s
 0/fG3Lo0fK1ZXgXEmexeiNsIfNP1ZBV+JboTnH3ldgXCx3nK8947Y/51KnND67QhwmZk
 MbP9luuRb4+C45foXiC7dEp1xVYuhunOJQlL0iuKx70hohthiZcbo38nbSc+FsnVptMz
 sKRl172wHwRCjtHSAUj75RrWKsxMk0okfedfoD5evMVNNm1+uM0ExfxKNY4u1O/1pmMt
 gw3y2XoCVK0gUjKN6y1amCU/NJ7UtUed1Icd6fVhjmh+Z6WzsX0ZcHsglQZDVXg6Lj6/ bg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30dn6st41d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Apr 2020 09:27:46 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 970FA100034;
 Wed, 15 Apr 2020 09:27:46 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8C3482A4D75;
 Wed, 15 Apr 2020 09:27:46 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG5NODE3.st.com
 (10.75.127.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 15 Apr
 2020 09:27:46 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 15 Apr 2020 09:27:46 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 2/2] net: dwc_eth_qos: implement phy reg
 and max-speed for stm32
Thread-Index: AQHWEvdbKu/9Mq1EfUmicWTd/a8xlw==
Date: Wed, 15 Apr 2020 07:27:46 +0000
Message-ID: <de1e6485-21f9-96c3-d759-8c5ef48cf856@st.com>
References: <20200318095016.19942-1-patrick.delaunay@st.com>
 <20200318095016.19942-2-patrick.delaunay@st.com>
In-Reply-To: <20200318095016.19942-2-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <4F9580DC1EA481438E68AC012CE438CF@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-15_01:2020-04-14,
 2020-04-15 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Christophe ROULLIER <christophe.roullier@st.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] net: dwc_eth_qos: implement phy reg
 and max-speed for stm32
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

On 3/18/20 10:50 AM, Patrick Delaunay wrote:
> Add management of property "reg" to configure @ of phy and
> also "max-speed" property to specify maximum speed in Mbit/s
> supported by the device
>
> Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
> Reviewed-by: Patrick DELAUNAY <patrick.delaunay@st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/net/dwc_eth_qos.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)


Applied to u-boot-stm/next

Thanks

Patrice

>
> diff --git a/drivers/net/dwc_eth_qos.c b/drivers/net/dwc_eth_qos.c
> index 4796659216..63f2086dec 100644
> --- a/drivers/net/dwc_eth_qos.c
> +++ b/drivers/net/dwc_eth_qos.c
> @@ -306,6 +306,8 @@ struct eqos_priv {
>  	struct clk clk_slave_bus;
>  	struct mii_dev *mii;
>  	struct phy_device *phy;
> +	int phyaddr;
> +	u32 max_speed;
>  	void *descs;
>  	struct eqos_desc *tx_descs;
>  	struct eqos_desc *rx_descs;
> @@ -1081,12 +1083,21 @@ static int eqos_start(struct udevice *dev)
>  	 * don't need to reconnect/reconfigure again
>  	 */
>  	if (!eqos->phy) {
> -		eqos->phy = phy_connect(eqos->mii, -1, dev,
> +		eqos->phy = phy_connect(eqos->mii, eqos->phyaddr, dev,
>  					eqos->config->interface(dev));
>  		if (!eqos->phy) {
>  			pr_err("phy_connect() failed");
>  			goto err_stop_resets;
>  		}
> +
> +		if (eqos->max_speed) {
> +			ret = phy_set_supported(eqos->phy, eqos->max_speed);
> +			if (ret) {
> +				pr_err("phy_set_supported() failed: %d", ret);
> +				goto err_shutdown_phy;
> +			}
> +		}
> +
>  		ret = phy_config(eqos->phy);
>  		if (ret < 0) {
>  			pr_err("phy_config() failed: %d", ret);
> @@ -1654,6 +1665,8 @@ static int eqos_probe_resources_stm32(struct udevice *dev)
>  	if (ret)
>  		return -EINVAL;
>  
> +	eqos->max_speed = dev_read_u32_default(dev, "max-speed", 0);
> +
>  	ret = clk_get_by_name(dev, "stmmaceth", &eqos->clk_master_bus);
>  	if (ret) {
>  		pr_err("clk_get_by_name(master_bus) failed: %d", ret);
> @@ -1677,6 +1690,7 @@ static int eqos_probe_resources_stm32(struct udevice *dev)
>  	if (ret)
>  		pr_warn("No phy clock provided %d", ret);
>  
> +	eqos->phyaddr = -1;
>  	ret = dev_read_phandle_with_args(dev, "phy-handle", NULL, 0, 0,
>  					 &phandle_args);
>  	if (!ret) {
> @@ -1689,6 +1703,9 @@ static int eqos_probe_resources_stm32(struct udevice *dev)
>  		if (ret)
>  			pr_warn("gpio_request_by_name(phy reset) not provided %d",
>  				ret);
> +
> +		eqos->phyaddr = ofnode_read_u32_default(phandle_args.node,
> +							"reg", -1);
>  	}
>  
>  	debug("%s: OK\n", __func__);
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
