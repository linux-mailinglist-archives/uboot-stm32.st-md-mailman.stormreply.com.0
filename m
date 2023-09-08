Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C498798EA0
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Sep 2023 21:06:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F1B8CC6B468;
	Fri,  8 Sep 2023 19:06:40 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D9CAC6B44F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Sep 2023 19:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1694199995; x=1694804795; i=xypron.glpk@gmx.de;
 bh=RdAhEAWyjTkpLA58ppjyUOMWj7qVS149qxXl8lGvfRU=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=YCSWZrIM09DwwQxxEjAKtUvUqWaIEUawehEMLfCkcXo3HBFtJk3h1m8mZRkobbyCkc+8FdF
 Pu1AvsVUkQyoHSt7HVvekmivcbbz9thWfbTZcdCusfkxQgRzG+DaJFOKnkZRrXwwwXp0IIJiy
 PtdSK1BIsXmZCEDQSBk3VA0zDx5l+zkWOMzstldH6gRhSlC1F3I+wcuF1TkChJ/aQKXqG1COx
 k+d7E3TmGte0Wssg6sZmWbQVsPTHQJj6xOTTFKyeq8yzkimuu34BysGngAGRhE5meCfZXjPiO
 7wmhyMFxk70r1SuH19pnRH/tE+fDQOfI2RPOY5MQxqaUfjolgzjQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.123.94] ([178.202.40.247]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MulmF-1pn8ie3CNP-00rpIT; Fri, 08
 Sep 2023 21:06:35 +0200
Message-ID: <99b66fba-e92a-4a6f-b1f7-428d814d402a@gmx.de>
Date: Fri, 8 Sep 2023 21:07:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, de-DE
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
References: <20230907162200.205602-1-gatien.chevallier@foss.st.com>
 <20230907162200.205602-3-gatien.chevallier@foss.st.com>
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
In-Reply-To: <20230907162200.205602-3-gatien.chevallier@foss.st.com>
X-Provags-ID: V03:K1:aShp9z5e5H2RoDLKXaqmg3xg8eRU9tYPJuIPv/iWyPzWsP8LAcZ
 WndZl2lAeWYhl+Xx9HT0Xp175XnZMMbDb+Y3fJRlC+QIl0mpCjMGssQTXrxgUwk92668mK0
 VQ+ini3RrXdlwvUT+EiMhVu4DIOZNmpfPtax5qbcpuzd0HevmCCHkdPeJmf9teQvSlCunpe
 yWDGBry+QNEzqYlBou3tg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:OHf3BlVq7lM=;zo4xDZdl+XItKdtbB+QHuSlZrKS
 YxY2hfEvgAbj3wiPDQRE4ZfMktZeMwCUkM578a7mWlPCL5mjiOeXX5yNfABWz6xvPEYf3xuSD
 /6HeUKBu2It6rcNcJCQI9gH9royf9MPt5WATnNKvECmdg89S3qn9ATpa/IwuNQQqV0XqSXJpU
 1X9fbEMGtMlW7/8JWtWDvtegr4nD06Qhg4qhpBrexZlLXCH3EGOIF+WZAWWIXgWzn11rsiV85
 4d58IB8o8eIIB2t+BwUnXDNeilL7hmqNDVLJF3Te8W3Cse8zgo4jMrFIW26cuopuuqhuCessq
 MgJsCmuusNTV1WSjgkbZ2jnh+AE1W09yz0MLCmQ7nfVVWKp9Yj45FxMGtm8FtdCShX1o1lKmo
 o33myt/XiSGSj59fOdZCUH63e+2/VvnJe6lVdssG6gpl0eYn2j2S4KjJhOLK2eqxKqfNLiltc
 /xzA6mU1Q331Or/4cRpx/lvv+xVKjvoFZAmsa9oiQMrypVDTtP/EWSccIE+6A1HfmNyxOTA/c
 pIlNq4nH9M575a+uZx0BkKBKbBtLMfEz65gUilXL1+F6SJZR3tUQigDtqsa9i91fNQaLcNZES
 T3HxerCxXuUYw3+fZR6wb5ro3BoOOp49u8MGHs7G3Kl9yLEu61diZjPw0TI1FkmmPM8QPxmCH
 vEtfRq5MXQeBAqi4J3+74wKCFw2vFNPA1qmvyDtcAxyv4+uYVlc6J7BY71vJQeXSkmYIFO+49
 fCCaSiN7/rIgYE452PUSh29efRbRslhHc4/LXknobYfF/p4+rsQx0fY1d3i6kSTV4suUec3k5
 ocuJ8LreNvAQdlAJ3QO9eCRmWSKSIImPj366H16IQDp3EGRmVKAASE0vs4wU6dG7ZeaDeePY2
 7iOjyyTuu27dsgsfCDnf4QkZVZ1BD6aYZycMuJ4GfDScJGpAsyJnediIyigowpE+P/1sCe/85
 ZhQhzFcMzuiyN8zQG8S8Q3QZvWU=
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Sughosh Ganu <sughosh.ganu@linaro.org>, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH 3/7] rng: stm32: Implement configurable
 RNG clock error detection
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

On 9/7/23 18:21, Gatien Chevallier wrote:
> RNG clock error detection is now enabled if the "clock-error-detect"
> property is set in the device tree.
>
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
>   drivers/rng/stm32_rng.c | 22 +++++++++++++++++-----
>   1 file changed, 17 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/rng/stm32_rng.c b/drivers/rng/stm32_rng.c
> index 89da78c6c8..ada5d92214 100644
> --- a/drivers/rng/stm32_rng.c
> +++ b/drivers/rng/stm32_rng.c
> @@ -40,6 +40,7 @@ struct stm32_rng_plat {
>   	struct clk clk;
>   	struct reset_ctl rst;
>   	const struct stm32_rng_data *data;
> +	bool ced;
>   };
>
>   static int stm32_rng_read(struct udevice *dev, void *data, size_t len)
> @@ -97,25 +98,34 @@ static int stm32_rng_init(struct stm32_rng_plat *pdata)
>
>   	cr = readl(pdata->base + RNG_CR);
>
> -	/* Disable CED */
> -	cr |= RNG_CR_CED;
>   	if (pdata->data->has_cond_reset) {
>   		cr |= RNG_CR_CONDRST;
> +		if (pdata->ced)
> +			cr &= ~RNG_CR_CED;
> +		else
> +			cr |= RNG_CR_CED;
>   		writel(cr, pdata->base + RNG_CR);
>   		cr &= ~RNG_CR_CONDRST;
> +		cr |= RNG_CR_RNGEN;
>   		writel(cr, pdata->base + RNG_CR);
>   		err = readl_poll_timeout(pdata->base + RNG_CR, cr,
>   					 (!(cr & RNG_CR_CONDRST)), 10000);
>   		if (err)
>   			return err;
> +	} else {
> +		if (pdata->ced)
> +			cr &= ~RNG_CR_CED;
> +		else
> +			cr |= RNG_CR_CED;
> +
> +		cr |= RNG_CR_RNGEN;
> +
> +		writel(cr, pdata->base + RNG_CR);
>   	}
>
>   	/* clear error indicators */
>   	writel(0, pdata->base + RNG_SR);
>
> -	cr |= RNG_CR_RNGEN;
> -	writel(cr, pdata->base + RNG_CR);
> -
>   	err = readl_poll_timeout(pdata->base + RNG_SR, sr,
>   				 sr & RNG_SR_DRDY, 10000);
>   	return err;
> @@ -165,6 +175,8 @@ static int stm32_rng_of_to_plat(struct udevice *dev)
>   	if (err)
>   		return err;
>
> +	pdata->ced = dev_read_bool(dev, "clock-error-detect");

The kernel describes this property in
Documentation/devicetree/bindings/rng/st,stm32-rng.yaml

Which patch is adding it to the U-Boot device-trees?
I can't find it in this patch series.

It would have been helpful to send a cover-letter with the patch series
to get an overview of the changed files in the patch set.

Best regards

Heinrich

> +
>   	return 0;
>   }
>

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
