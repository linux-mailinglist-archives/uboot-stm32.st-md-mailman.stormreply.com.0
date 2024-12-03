Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 619079E300E
	for <lists+uboot-stm32@lfdr.de>; Wed,  4 Dec 2024 00:47:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1DC9FC6DD72;
	Tue,  3 Dec 2024 23:47:39 +0000 (UTC)
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF6D7C6C841
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Dec 2024 23:47:31 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20241203234728epoutp01992da245f25452e64482c70cce2fd44d~Nz4-6JrIG2513925139epoutp01a
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Dec 2024 23:47:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20241203234728epoutp01992da245f25452e64482c70cce2fd44d~Nz4-6JrIG2513925139epoutp01a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1733269648;
 bh=BAYsOryYOnm8EOwjb/qKaFG34Y5ViExcdV1aJYC9z58=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=GVyZ+IPRiSs3c3nhVfeIH0hDQ2GKO1k3gdigxIQtwy0mJnd/Wye4Y/2l2A+FvZUOb
 wVj7C5zFYrAmYcZ7I8Z4E4WuJdavkE5G20PzMR0SyZyEC9coMjE+3PElVVWnlHYnXw
 eScoLvV6or7R86UNMx1vyagqn+QlOMaSQUNCOQs8=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20241203234728epcas1p3a66bdf8f3f088281ed1f906c4ffbb94c~Nz4-YRy9E2556425564epcas1p3T;
 Tue,  3 Dec 2024 23:47:28 +0000 (GMT)
Received: from epsmgec1p1-new.samsung.com (unknown [182.195.38.236]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4Y2y4b5FrWz4x9Pp; Tue,  3 Dec
 2024 23:47:27 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmgec1p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
 FD.84.31735.F889F476; Wed,  4 Dec 2024 08:47:27 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20241203234727epcas1p376e3e4f1cc884fb1ce05b2777bb20959~Nz4_Y77OE2779727797epcas1p3F;
 Tue,  3 Dec 2024 23:47:27 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20241203234727epsmtrp29156ab8561db99fdc06f99f849ce0993~Nz4_YEvQD1788017880epsmtrp2n;
 Tue,  3 Dec 2024 23:47:27 +0000 (GMT)
X-AuditID: b6c32a4c-ac3ff70000007bf7-55-674f988f8ab9
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 28.7A.18729.F889F476; Wed,  4 Dec 2024 08:47:27 +0900 (KST)
Received: from jh80chung01 (unknown [10.113.111.84]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20241203234726epsmtip163c81ad828f5931774e165aef28eb782~Nz4_GR1I11695216952epsmtip1v;
 Tue,  3 Dec 2024 23:47:26 +0000 (GMT)
From: "Jaehoon Chung" <jh80.chung@samsung.com>
To: "'Patrice Chotard'" <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
In-Reply-To: <20241203100611.354468-2-patrice.chotard@foss.st.com>
Date: Wed, 4 Dec 2024 08:47:26 +0900
Message-ID: <000101db45dd$b54ddef0$1fe99cd0$@samsung.com>
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHJXg/s3915w2qFAukO13E/llQlpwJ7XfgCA01hB8OyyrlHUA==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCJsWRmVeSWpSXmKPExsWy7bCmgW7/DP90g7+fVCxOvrnKYvGmrZHR
 4ufJ9+wWk9ZfY7dYf3kbu8W3LdsYLaZO2sxu8XZvJ7vFwq3LWRw4Pd4+ncLoMbvhIovHvFkn
 WDye9m9l93h1YBW7x4kJl5g8zt7ZwehxcJ9hAEdUtk1GamJKapFCal5yfkpmXrqtkndwvHO8
 qZmBoa6hpYW5kkJeYm6qrZKLT4CuW2YO0H1KCmWJOaVAoYDE4mIlfTubovzSklSFjPziElul
 1IKUnALTAr3ixNzi0rx0vbzUEitDAwMjU6DChOyMO39OsBTs5a34fmc5YwPjGu4uRk4OCQET
 iel72lm6GLk4hAT2MEqsOvkIyvnEKPG18y0rhPONUeLb32XsMC297zqgqvYySmxcsJkJwnnJ
 KHG0cykLSBWbgJ7E/0ULmUFsEQF/ieeTZzCCFDEL7GCS2PZlJViCU8BJYtXXt2wgtrBAusTc
 qQvBmlkEVCR2/L8HZvMKWEqs+L+YEWK1gsTPp8tYIYY6STT+/goWZxYQkZjd2cYMskBCoJdD
 4lhPMytEg4vEyTfXoJqFJV4d3wL1g5TE53d72SAamhklli45yArh9DBK/Gu4zgZRZSyxf+lk
 oOc4gFZoSqzfpQ+xjU/i3dceVpCwhACvREebEES1isSl1y+ZYObfffIfqsRDYus0DkgInWWU
 6Dh/l2kCo/wsJHfPQliwgJFpFaNUakFxbnpqsmGBoW5eajk8QpPzczcxgpOnls8Oxu/r/+od
 YmTiYDzEKMHBrCTCu3y9d7oQb0piZVVqUX58UWlOavEhRlNgaE5klhJNzgem77ySeEMTSwMT
 MyNjEwtDM0Mlcd4zV8pShQTSE0tSs1NTC1KLYPqYODilGpikNk3IWzdP5PI/Y783vR/2HN52
 9Pan1iWiUluLWvq87vzvedoRXy7+7cJlqY7HUwTn+GzMZXu+5fD2Cd/X3p9p8b7sufTpwH/R
 QnliDjMEdnYvlXwkWNizYhZbx+9zVhEtC++Wfc59cs7MfO6ybvMakb/b+LU/HXwZE2zVtD12
 f8fCMuGX85ec57WIOym9uXtiDb+qcavsxkcTA9seG/AGTSvoNuKa+4rb8Mtvx8QPP7/n5Z6d
 GhZftTmmPzJcTKb3di53pfff/2yzVThce77fu7Nzyv76ZK2vIsvO8N+0CN25pOWvp8DqROb3
 bfoFimuN1/N938yVK9ZyOHR5teDjTl2hmbm/Ap7PXTBBOMdEiaU4I9FQi7moOBEABNnK3CcE
 AAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKLMWRmVeSWpSXmKPExsWy7bCSnG7/DP90g4fLWS1OvrnKYvGmrZHR
 4ufJ9+wWk9ZfY7dYf3kbu8W3LdsYLaZO2sxu8XZvJ7vFwq3LWRw4Pd4+ncLoMbvhIovHvFkn
 WDye9m9l93h1YBW7x4kJl5g8zt7ZwehxcJ9hAEcUl01Kak5mWWqRvl0CV8adPydYCvbyVny/
 s5yxgXENdxcjJ4eEgIlE77sOli5GLg4hgd2MEs1tH9kgElISn59OBbI5gGxhicOHiyFqnjNK
 nJ0ziRmkhk1AT+L/ooVgtoiAv8TzyTMYQYqYBfYwSVxu+soO0XGSUeLuyWfsIFWcAk4Sq76+
 BdsgLJAqcXbLXlYQm0VARWLH/3ssIDavgKXEiv+LGSGuUJD4+XQZK8QGJ4nG31/B4swCIhKz
 O9uYJzAKzELiLmBkXMUomVpQnJueW2xYYJiXWq5XnJhbXJqXrpecn7uJERzyWpo7GLev+qB3
 iJGJg/EQowQHs5II7/L13ulCvCmJlVWpRfnxRaU5qcWHGKU5WJTEecVf9KYICaQnlqRmp6YW
 pBbBZJk4OKUamKxdujPCFPx+xxrdmrW91itzo37sE4/Lx93cNVeLCLTXcK++wjZHy8Uwm8Wj
 cO4B0YhtnILWejX/d727OvlucOe553M3rJmwdU7Ei9gvan6/OYt/yArycqS0+/zZcVJ3RVFe
 6+wLr92P/shKKBPiOmuX4bFudwFTjXtI46GPu3t7HZfoNcgXm/4XCb7ZMK9cnZOtW/rIf+bt
 Vj/td9r2VCpu/8gkKOL/5IvD34mH/2y6H1fOY2X6w8J1XuKeyMy8cibdopSkbyfPneaas3ct
 xwmurmdXHGUrVfl3FcjcviH+5vChOvHPVdlhk6X5BP9tr/ynZr6PW/Hng+NG0bnf1stxWfXt
 kVJvPrZ+mvQkJZbijERDLeai4kQANBSjrugCAAA=
X-CMS-MailID: 20241203234727epcas1p376e3e4f1cc884fb1ce05b2777bb20959
X-Msg-Generator: CA
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241203101038epcas1p390bf81617407bbc930d250d73e97e3e8
References: <20241203100611.354468-1-patrice.chotard@foss.st.com>
 <CGME20241203101038epcas1p390bf81617407bbc930d250d73e97e3e8@epcas1p3.samsung.com>
 <20241203100611.354468-2-patrice.chotard@foss.st.com>
Cc: 'Marek Vasut' <marex@denx.de>, 'Tom Rini' <trini@konsulko.com>,
 'Jonas Karlman' <jonas@kwiboo.se>, 'Quentin Schulz' <quentin.schulz@cherry.de>,
 'Simon Glass' <sjg@chromium.org>,
 'U-Boot STM32' <uboot-stm32@st-md-mailman.stormreply.com>,
 'Patrick DELAUNAY' <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 2/2] power: regulator: replace
 dev_dbg() by dev_err() in regulator_post_bind()
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>



> -----Original Message-----
> From: Patrice Chotard <patrice.chotard@foss.st.com>
> Sent: Tuesday, December 3, 2024 7:06 PM
> To: u-boot@lists.denx.de
> Cc: Patrice CHOTARD <patrice.chotard@foss.st.com>; Patrick DELAUNAY <patrick.delaunay@foss.st.com>; U-
> Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>; Jaehoon Chung <jh80.chung@samsung.com>; Jonas
> Karlman <jonas@kwiboo.se>; Marek Vasut <marex@denx.de>; Quentin Schulz <quentin.schulz@cherry.de>;
> Simon Glass <sjg@chromium.org>; Tom Rini <trini@konsulko.com>
> Subject: [PATCH v2 2/2] power: regulator: replace dev_dbg() by dev_err() in regulator_post_bind()
>
> To ease debugging, use dev_err() instead of dev_dbg() for
> alerting when regulator has nonunique value.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>

Reviewed-by: Jaehoon Chung <jh80.chung@samsung.com>

Best Regards,
Jaehoon Chung

>
> ---
>
> Changes in v2:
>   - split initial patch into 2 commits to separate dev_dbg() and
>     dev_err() migration.
>
>  drivers/power/regulator/regulator-uclass.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/power/regulator/regulator-uclass.c b/drivers/power/regulator/regulator-uclass.c
> index 80ea5e65d48..09567eb9dbb 100644
> --- a/drivers/power/regulator/regulator-uclass.c
> +++ b/drivers/power/regulator/regulator-uclass.c
> @@ -446,7 +446,7 @@ static int regulator_post_bind(struct udevice *dev)
>  	}
>
>  	if (!regulator_name_is_unique(dev, uc_pdata->name)) {
> -		dev_dbg(dev, "'%s' has nonunique value: '%s\n",
> +		dev_err(dev, "'%s' has nonunique value: '%s\n",
>  			property, uc_pdata->name);
>  		return -EINVAL;
>  	}
> --
> 2.25.1



_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
