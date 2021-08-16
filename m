Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6F43EDC98
	for <lists+uboot-stm32@lfdr.de>; Mon, 16 Aug 2021 19:50:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A58E0C57B6B;
	Mon, 16 Aug 2021 17:50:29 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9F17C57B60
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Aug 2021 17:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1629136225;
 bh=Bnwq63RmsBLB4ohzPRXFizKs7wR8YS9GbHDxqEbTgJk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=CLIyV+Z6AZmnj8YmoKPWKcb107ra3XdgQoejbMLdkgY+ziBASgJHNwJvIAJpqzyxI
 7vCrBoByLTbsW+KmT3v3LMLSXrfyhkijcje0GZfF/LVSdlvJ97LrvJmxQxUvwLLtXG
 LKCv4JvaUC44N52ppNqrDP3stMtdYS8vikfQHX6E=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from workstation5.fritz.box ([88.152.144.157]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MdvmO-1mpIUJ17xe-00b2Yv; Mon, 16 Aug 2021 19:50:25 +0200
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>
Date: Mon, 16 Aug 2021 19:49:59 +0200
Message-Id: <20210816174959.1472935-1-xypron.glpk@gmx.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:v8e7t5PwnelDRlk51P7m7nXcynLgXTjR0fOLS3/AA6nOu2SwA7I
 3mLEPjVr+04XgGzhcJWxO/qGbsiYMT8foC3izCLdVM9HD7IzPmQ90UVO1B+/WPA9OCg3JGV
 mS8d8RPoAcmR/tABf9bM/m/qCxq0DgNYrGT9Ltq8hnndeUefWFWarcwSsV/j3oV5F2nj+Ua
 SQUAOHQlztn+yKzksrkGg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:MhaARf420iA=:+vwkzTzgxSV1Z290q/gOVF
 q2KMdTpz5cwlCxs9XCEhwhCJo1oTdDpLjP5c6NuRXmfkWrhEKVwQJcilxXUoKSRIaT1qcNJ4d
 266kUDT6Hbd1NF8PRwtrej9np042xLk3lNiuz/pQtfBl12Ep00rQBe5VoPMr9fJQt4rkymQKH
 +7edUCoauq2DROxPahbPHGQXJdSX4W1dFpiZx938ALFgdk/yTE2DRcNf1WwJUHcHFIvqvvARH
 6+2rwc2gqXrBZdu45eDEmVMPayOHYWJzutRQnye9jVaTq/dT1X1OhEMpPkNbAUafALEK5vqaT
 2QPVuDI2MiMcgpekOVQSwrMH4FxdOp5R0bGF6KCx2WIp3SfO1xDvQfF0ttMATYV+yLmpVkCDf
 jsBoYN6DK3OkQuqEo8iyaD17sAMlcxA7t2M7Jm36c37Dj1GG3llX/9+JlcBxiSqq3NvxtWnwf
 E/OVFrdAHc1huEcMXPnWm2d1KUEYHWu74L/QnCuZPQOBo1/lLfQPU4x5tz4wy4FlNiHMTFZlN
 rJnPYUa4t2ri9+gjaBfSKeZ0xw6Mt0AblcQnc7ExXaJG6WClD6RIehcYjY/GSinDMsDv5FTGe
 zZi7CMUSsi2kXTAcz09qNVa2ffquoCpojmZL/IIBodIIF7VoMDkNOGSCVkYZRkkQpGzkEvoxI
 XJqbQVDnwUP60p05e4u3UaSf2xCx6qDuXniLvkxVK6vShVwNn3p9cWptF32imk+mDjxOlnX/f
 BEiQQSVD2oxwIVZKXjt/avytq6AFsjyLZUPXsSV63wXqkK1KZJOeu+Y8thm+ju2BCg4kSfUtw
 7R0tPqQ34qoRRncAnCaMefotkBQX8AFCiOIrXh9mU8dHmjSQQyxw4K2m5VLN4AuV5Zoajqknu
 jogitIdsKAW1vsSV41tRkgy+XvWxPA3ZunYIJ+xTUw58NSbDO1+JNmJfqu+57Q//IOQ+q6sTO
 zDiwPwW9p2rK/WTh3u7+HevvHgHJB3TzVQA2XHTmPEnvhykiILCU8T7B5rDEDVexnwJtlJHNy
 2yzHLuzYTg7bY9sxJm51kp+DOyL/7TK1Y+4egk/zo4KOub4wJIa0NCKjcA1OvGfwBL9+Ck1YT
 AGPdiMZccBx656kxypyuw6dFNKxPMNv9/kVkcJia9pQtgNq7rcNsZsMPw==
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: [Uboot-stm32] [PATCH 1/1] doc: move doc/board/st/st.rst
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

'make htmldocs' does not use file doc/board/st/st.rst because the name
matches the directory name. Let's rename it to st-dt.rst.

Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
---
 doc/board/st/index.rst             | 2 +-
 doc/board/st/{st.rst => st-dt.rst} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename doc/board/st/{st.rst => st-dt.rst} (100%)

diff --git a/doc/board/st/index.rst b/doc/board/st/index.rst
index 8a06a954a2..9bba42f1da 100644
--- a/doc/board/st/index.rst
+++ b/doc/board/st/index.rst
@@ -6,5 +6,5 @@ STMicroelectronics
 .. toctree::
    :maxdepth: 2

-   st
+   st-dt
    stm32mp1
diff --git a/doc/board/st/st.rst b/doc/board/st/st-dt.rst
similarity index 100%
rename from doc/board/st/st.rst
rename to doc/board/st/st-dt.rst
--
2.30.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
