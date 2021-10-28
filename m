Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC7E43F2F0
	for <lists+uboot-stm32@lfdr.de>; Fri, 29 Oct 2021 00:47:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91C39C5E2C2;
	Thu, 28 Oct 2021 22:47:00 +0000 (UTC)
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31102C5E2BA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Oct 2021 22:46:56 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20211028224654epoutp0337e5bde1ca11913544f567a965f3b595~yU08uwlAH0257002570epoutp03a
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Oct 2021 22:46:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20211028224654epoutp0337e5bde1ca11913544f567a965f3b595~yU08uwlAH0257002570epoutp03a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1635461214;
 bh=w46y9caPmfXGignqSaX1av+2RJzH6V6oes9+jZ1eFoQ=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=SyHYHZhHne51+r0nqATPwLawzB6Rr4jGYuGLngu5fjmzdE2NGrDEDaURfOgR26oaO
 YGqZlrjKBqOGqZm6b1ytmK2VI/wmaZuzqUGYP7Od3ULq53T9xp2I0qm2kGvkXxmvG7
 xU5/4YwXYqSWWHRrFSK2ejLMHzWerkuSq6sttgrA=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20211028224654epcas1p3d19eef508314831b5533eda3a6298748~yU08hgUMH1102211022epcas1p38;
 Thu, 28 Oct 2021 22:46:54 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.38.235]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4HgLK6743Mz4x9Q6; Thu, 28 Oct
 2021 22:46:50 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 84.C9.21932.A582B716; Fri, 29 Oct 2021 07:46:50 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20211028224650epcas1p35cf776ca1b5288430e70f2f982c6bf51~yU05Tx6yv1101611016epcas1p36;
 Thu, 28 Oct 2021 22:46:50 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20211028224650epsmtrp19209d5bb707e72a08a6af9bdc7b97fa4~yU05UWxol2489124891epsmtrp1L;
 Thu, 28 Oct 2021 22:46:50 +0000 (GMT)
X-AuditID: b6c32a38-929ff700000255ac-df-617b285a2c9c
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 0E.24.08738.A582B716; Fri, 29 Oct 2021 07:46:50 +0900 (KST)
Received: from [10.113.113.235] (unknown [10.113.113.235]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20211028224650epsmtip1f0843596f9f428da317425ea513a9548~yU05IY7JG3108331083epsmtip1x;
 Thu, 28 Oct 2021 22:46:50 +0000 (GMT)
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
From: Jaehoon Chung <jh80.chung@samsung.com>
Message-ID: <2b39a565-3991-3ea2-612e-1ad7cdf5ef7d@samsung.com>
Date: Fri, 29 Oct 2021 07:47:32 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211028191222.v3.3.I8edf9d3b9867194e233bba15ce32a1477ce4bbef@changeid>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupik+LIzCtJLcpLzFFi42LZdlhTXzdKozrRYP5bC4uj7euZLSa1drNZ
 TFp/jd3i7d5OdouFW5ezOLB6PO3fyu5x59oeNo+zd3YwehzcZxjAEpVtk5GamJJapJCal5yf
 kpmXbqvkHRzvHG9qZmCoa2hpYa6kkJeYm2qr5OIToOuWmQO0V0mhLDGnFCgUkFhcrKRvZ1OU
 X1qSqpCRX1xiq5RakJJTYFqgV5yYW1yal66Xl1piZWhgYGQKVJiQnXHt+GnWgjb2iq0L1rA0
 ML5g7WLk5JAQMJHob73G1sXIxSEksINR4s+PI8wQzidGiWVvF7NCOJ8ZJfq/vGGHaWk9cYMd
 IrGLUWL9z1VQVe8ZJS7M7GMEqRIWcJdYunUjC4gtIuApcfPZbkaQImaBBYwSX17OAkuwCehI
 bP92nAnE5hWwk3h9YCnYChYBVYkTfW/ALhQViJT4e3IXK0SNoMTJmU+Aejk4OAVCJU61m4OE
 mQXEJW49mc8EYctLbH87B+wHCYGf7BK9p09Ane0isfrSIaivhSVeHd8CFZeSeNnfBmVXS+xq
 PgPV3MEocWtbExNEwlhi/9LJTCCLmQU0Jdbv0ocIK0rs/D2XEWIxn8S7rz2sICUSArwSHW1C
 ECUqEpdev2SCWXX3yX+oEzwk9j1qZp3AqDgLyWezkLwzC8k7sxAWL2BkWcUollpQnJueWmxY
 YAKP7uT83E2M4ESpZbGDce7bD3qHGJk4GA8xSnAwK4nwXp5XnijEm5JYWZValB9fVJqTWnyI
 0RQY1hOZpUST84GpOq8k3tDE0sDEzMjYxMLQzFBJnPezXGGikEB6YklqdmpqQWoRTB8TB6dU
 AxPj64afiS9cdW25pE5tfVloJnHbsqpfuW6vsO58CUPvtJqve/zr5G/dC12cljmhn3FWTpmE
 5eWsMzf6H50UvyH26rNUpnBTvn3cnFr3OQUN4kk9vcze7GsNdS5t6FSXNlS4ZL9g665pJt+a
 rrkwlWcp+W1r2Kvy+NiXmEtdnH31217UXXo6vdVHYtEZ/X8rtroc8Cg49Mnms/yO+7krVt/Z
 cejuk6elkk0qphx6nOLpDE2Zc0T2TldYcGnFifO5bTs++16umSzfVSl5s99yqVb/zZdV6WLe
 Lyfn5V248GyuTM+vuXpz5Bf/EL97aPYVncjSDsVTpb5ffmwuP6/S4/n98v+VnLbyE/l0l6b6
 diuxFGckGmoxFxUnAgCOQ7ebHQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBLMWRmVeSWpSXmKPExsWy7bCSnG6URnWiwcb7ihZH29czW0xq7Waz
 mLT+GrvF272d7BYLty5ncWD1eNq/ld3jzrU9bB5n7+xg9Di4zzCAJYrLJiU1J7MstUjfLoEr
 49rx06wFbewVWxesYWlgfMHaxcjJISFgItF64gZ7FyMXh5DADkaJiT3ToBJSEp+fTmXrYuQA
 soUlDh8uhqh5yyhx4PcuRpAaYQF3iaVbN7KA2CICnhI3n+1mBCliFljAKPHp/FpGiI73jBI7
 zixlB6liE9CR2P7tOBOIzStgJ/H6AEScRUBV4kTfG7DNogKREk0ntrJB1AhKnJz5hAXkCk6B
 UIlT7eYgYWYBdYk/8y4xQ9jiEreezGeCsOUltr+dwzyBUWgWku5ZSFpmIWmZhaRlASPLKkbJ
 1ILi3PTcYsMCo7zUcr3ixNzi0rx0veT83E2M4MjQ0trBuGfVB71DjEwcjIcYJTiYlUR4L88r
 TxTiTUmsrEotyo8vKs1JLT7EKM3BoiTOe6HrZLyQQHpiSWp2ampBahFMlomDU6qB6YiKs4WY
 3OkTjy1PS4QEvP7xQ0a68Ptp5dSSf2LbekQ/Ht70ci6XXeX6Y5mPJm44eWhWwsMGaY8LDCZ3
 1C8Fy5oYck1fedFJpNdrZaKAiLv8LXeHic7rrrkqz9u753Iz1+8tazYbvtrZJGBjEs8it/fU
 1CeSOi4526LuJmQGmeWxJl/w1Xq8ukLpeYy5Ufk1sfybVpY6Ops4yxe+Ou9ZnxJeMHGmqnnp
 pjS7LRyX/h/ev05frezLD7bbiwLvPmgsWcnLu4XhC5P3xdWO67urHM5bcUYoCm1VnSJyOHDv
 5W5f74/6xgffBEvPjLDLC3Tyivynrvxla2rc7CrldpsyJu671dtub/JluH40aHqsEktxRqKh
 FnNRcSIAIeUaafsCAAA=
X-CMS-MailID: 20211028224650epcas1p35cf776ca1b5288430e70f2f982c6bf51
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211028171335epcas1p2cb63831348d1f7584c0f077549f3953f
References: <20211028191222.v3.1.I8edf9d3b9867194e233bba15ce32a1477ce4@changeid>
 <CGME20211028171335epcas1p2cb63831348d1f7584c0f077549f3953f@epcas1p2.samsung.com>
 <20211028191222.v3.3.I8edf9d3b9867194e233bba15ce32a1477ce4bbef@changeid>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Etienne Carriere <etienne.carriere@linaro.org>,
 Etienne Carriere <etienne.carriere@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v3 3/5] power: regulator: scmi: define
	LOG_CATEGORY
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

On 10/29/21 2:13 AM, Patrick Delaunay wrote:
> Define LOG_CATEGORY to allow filtering with log command.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Acked-by: Etienne Carriere <etienne.carriere@linaro.org>

Reviewed-by: Jaehoon Chung <jh80.chung@samsung.com>

Best Regards,
Jaehoon Chung

> ---
> 
> (no changes since v1)
> 
>  drivers/power/regulator/scmi_regulator.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/power/regulator/scmi_regulator.c b/drivers/power/regulator/scmi_regulator.c
> index b3142bf4e1..3ddeaf4adc 100644
> --- a/drivers/power/regulator/scmi_regulator.c
> +++ b/drivers/power/regulator/scmi_regulator.c
> @@ -2,6 +2,9 @@
>  /*
>   * Copyright (C) 2020-2021 Linaro Limited
>   */
> +
> +#define LOG_CATEGORY UCLASS_REGULATOR
> +
>  #include <common.h>
>  #include <dm.h>
>  #include <errno.h>
> 

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
